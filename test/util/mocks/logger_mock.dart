import 'package:logger/logger.dart';

class LoggerMock implements Logger {
  @override
  void close() {}

  @override
  // ignore: type_annotate_public_apis
  void d(message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void e(message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void i(message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void log(Level level, message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void v(message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void w(message, [error, StackTrace? stackTrace]) {}

  @override
  // ignore: type_annotate_public_apis
  void wtf(message, [error, StackTrace? stackTrace]) {}
}
