import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppHttpClient with DioMixin implements Dio {
  AppHttpClient() {
    options = BaseOptions();
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
