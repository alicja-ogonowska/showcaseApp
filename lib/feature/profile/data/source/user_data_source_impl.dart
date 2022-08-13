import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase_app/feature/profile/data/model/user_model.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source.dart';

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;
  static const String userKey = 'userKey';

  @override
  Future<UserModel?> checkAuthenticatedUser() async {
await _getSomeDelay();
    final String? savedUser = _sharedPreferences.get(userKey) as String?;
    if (savedUser != null) {
      return UserModel(email: savedUser, name: 'Name', id: '123');
    }
    return null;
  }

  @override
  Future<UserModel> login(String email, String password) async {
    await _getSomeDelay();
    _sharedPreferences.setString(userKey, email);
    return UserModel(email: email, name: 'Name', id: '123');
  }

  @override
  Future<void> logout() async {
    _sharedPreferences.remove(userKey);
  }


  Future<void> _getSomeDelay() async {
    await Future.delayed(const Duration(seconds: 1));
  }

}
