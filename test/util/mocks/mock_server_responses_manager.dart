import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../json/json_reader.dart';

/// It mocks server responses - for each api call it returns a previously
/// defined mocked response.
class MockServerResponsesManager {
  factory MockServerResponsesManager() {
    return _singleton;
  }

  MockServerResponsesManager._internal();

  static final MockServerResponsesManager _singleton =
      MockServerResponsesManager._internal();

  /// Map of api calls for which a mocked response is provided
  final Map<ApiCall, MockServerResponse> _mockResponses =
      <ApiCall, MockServerResponse>{};

  /// Method used to return a mocked response (if previously defined) for a
  /// given url and api call protocol
  Future<Response<T>> mockCallForUrl<T>(
    Uri url,
    ApiCallProtocol apiCallProtocol, {
    Object? requestBody,
  }) async {
    final ApiService? apiService = getApiServiceFromUrl(url);
    if (apiService == null) {
      // ignore: avoid_print
      print('Test could not find api service for url $url');
      throw UnimplementedError('Test could not find api service for url $url');
    }
    switch (apiService) {
      case ApiService.postsDataSource:
        if (apiCallProtocol == ApiCallProtocol.GET) {
          return _createMockResponseForApiCall(
            ApiCall.getPosts,
            requestBody,
            url,
          );
        } else if (apiCallProtocol == ApiCallProtocol.POST) {
          return _createMockResponseForApiCall(
            ApiCall.addPost,
            requestBody,
            url,
          );
        }
        break;
    }
    // ignore: avoid_print
    print('Test could not find api call for url $url');
    throw UnimplementedError('Test could not find api call for url $url');
  }

  Future<Response<T>> _createMockResponseForApiCall<T>(
    ApiCall apiCall,
    Object? requestBody,
    Uri url,
  ) {
    if (_mockResponses.containsKey(apiCall)) {
      final mockServerResponse = _mockResponses[apiCall]!;
      return _executeMockServerResponse<T>(
        apiCall,
        requestBody,
        mockServerResponse,
      );
    } else {
      // ignore: avoid_print
      print('Api call $apiCall is not mocked in test');
      throw UnimplementedError('Api call $apiCall is not mocked in test');
    }
  }

  Future<Response<T>> _executeMockServerResponse<T>(
    ApiCall apiCall,
    Object? requestBody,
    MockServerResponse mockServerResponse,
  ) async {
    if (mockServerResponse.type == MockServerResponseType.timeout) {
      throw const SocketException('Timeout');
    } else {
      final response = Response(
        data: await _createBodyFromMockServerResponse(
          mockServerResponse,
        ) as T?,
        statusCode: mockServerResponse.type.getCode(),
        requestOptions: RequestOptions(
          path: apiCall.toString(),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );

      // Dio converts received data to json object by default.
      if (response.data != null && T is! String && response.data is String) {
        response.data = json.decode(response.data.toString()) as T;
      }

      if (mockServerResponse.type == MockServerResponseType.code_200 ||
          mockServerResponse.type == MockServerResponseType.code_201) {
        return response;
      }

      // If response type is not 200 or 201, an error should be thrown.
      throw DioError(
        requestOptions: RequestOptions(path: 'https://local.host'),
        response: response,
      );
    }
  }

  /// Returns either data parsed from json file or error body.
  Future<dynamic> _createBodyFromMockServerResponse(
    MockServerResponse mockServerResponse,
  ) async {
    if (mockServerResponse.errorCode == null) {
      return json.decode(
        await readJsonFromFile(mockServerResponse.responseJsonFilePath),
      );
    } else {
      return {
        'errors': [
          {
            'code': '${mockServerResponse.errorCode}',
            'message': '${mockServerResponse.errorMessage}',
          }
        ],
      };
    }
  }

  void mockServerResponse(
    ApiCall apiCall,
    MockServerResponseType mockResponseType, {
    String? errorCode,
    String? errorMessage,
    String? responseJsonFilePath,
  }) {
    _mockResponses[apiCall] = MockServerResponse(
      type: mockResponseType,
      errorCode: errorCode,
      errorMessage: errorMessage,
      responseJsonFilePath: responseJsonFilePath,
    );
  }

  /// Clears mocked responses between tests.
  void clearAll() {
    _mockResponses.clear();
  }
}

class MockServerResponse extends Equatable {
  const MockServerResponse({
    required this.type,
    this.errorCode,
    this.errorMessage,
    this.responseJsonFilePath,
  });

  final MockServerResponseType type;
  final String? errorCode;
  final String? errorMessage;
  final String? responseJsonFilePath;

  @override
  List<Object?> get props => [
        type,
        errorCode,
        errorMessage,
        responseJsonFilePath,
      ];
}

enum ApiCallProtocol {
  // ignore: constant_identifier_names
  GET,
  // ignore: constant_identifier_names
  POST
}

enum ApiCall {
  getPosts,
  addPost,
}

enum ApiService {
  postsDataSource,
}

ApiService? getApiServiceFromUrl(Uri url) {
  for (final apiService in ApiService.values) {
    if (url
        .toString()
        .toLowerCase()
        .contains(apiService.toString().toLowerCase())) {
      return apiService;
    }
  }
  return null;
}

enum MockServerResponseType {
  code_200,
  code_201,
  code_400,
  code_401,
  code_403,
  code_404,
  code_406,
  code_500,
  code_503,
  timeout
}

extension on MockServerResponseType {
  // ignore: missing_return
  int getCode() {
    switch (this) {
      case MockServerResponseType.code_200:
        return 200;
      case MockServerResponseType.code_201:
        return 201;
      case MockServerResponseType.code_400:
        return 400;
      case MockServerResponseType.code_401:
        return 401;
      case MockServerResponseType.code_403:
        return 403;
      case MockServerResponseType.code_404:
        return 404;
      case MockServerResponseType.code_406:
        return 406;
      case MockServerResponseType.code_500:
        return 500;
      case MockServerResponseType.timeout:
        return 408;
      case MockServerResponseType.code_503:
        return 503;
    }
  }
}
