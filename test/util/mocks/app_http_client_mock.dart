import 'package:dio/dio.dart';
import 'package:showcase_app/base/data/http/app_http_client.dart';

import 'mock_server_responses_manager.dart';

class AppHttpClientMock extends AppHttpClient {
  AppHttpClientMock() : super();

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return MockServerResponsesManager().mockCallForUrl<T>(
      Uri.parse(path),
      ApiCallProtocol.GET,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return MockServerResponsesManager().mockCallForUrl<T>(
      Uri.parse(path),
      ApiCallProtocol.POST,
      requestBody: data,
    );
  }
}
