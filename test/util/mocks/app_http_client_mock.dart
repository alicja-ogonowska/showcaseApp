import 'package:dio/dio.dart';
import 'package:showcase_app/base/data/http/app_http_client.dart';

import 'mock_server_responses_manager.dart';

class AppHttpClientMock extends AppHttpClient {
  AppHttpClientMock() : super();

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> deleteUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    // TODO: implement deleteUri
    throw UnimplementedError();
  }

  @override
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<Response> downloadUri(
    Uri uri,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) {
    // TODO: implement downloadUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return MockServerResponsesManager()
        .mockCallForUrl<T>(Uri.parse(path), ApiCallProtocol.GET);
  }

  @override
  Future<Response<T>> getUri<T>(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement getUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> head<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patchUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement patchUri
    throw UnimplementedError();
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

  @override
  Future<Response<T>> postUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement postUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> putUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement putUri
    throw UnimplementedError();
  }
}
