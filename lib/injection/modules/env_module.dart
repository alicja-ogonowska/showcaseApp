import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {
  @Named('apiKey')
  String apiKey() => dotenv.env['API_KEY'].toString();

  @Named('userId')
  int userId() => int.parse(dotenv.env['USER_ID'].toString());
}
