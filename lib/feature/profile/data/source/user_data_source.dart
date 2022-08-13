import 'package:showcase_app/feature/profile/data/model/user_model.dart';

abstract class UserDataSource {
  Future<UserModel?> checkAuthenticatedUser();

  Future<UserModel> login(String email, String password);

  Future<void> logout();
}
