import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerModule {
  @injectable
  Logger getLogger() => Logger();
}
