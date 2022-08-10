import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @Named('baseUrl')
  String baseUrl() => 'https://gorest.co.in/public/v2';
}
