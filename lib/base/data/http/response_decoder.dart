import 'package:dio/dio.dart';

typedef JsonDecoder<T> = T Function(Map<String, dynamic>);

extension ResponseDecoder on Response {
  T decode<T>({
    required JsonDecoder<T> decoder,
  }) {
    if (data != null) {
      final decodedBody = data as Map<String, dynamic>;
      return decoder(decodedBody);
    }
    throw DioError(requestOptions: requestOptions, response: this);
  }
}
