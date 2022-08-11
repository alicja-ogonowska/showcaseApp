import 'package:showcase_app/feature/profile/domain/entity/user.dart';

abstract class UserDataSource {
  Future<User?> checkAuthenticatedUser();

  Future<User> login(String email, String password);

  Future<void> logout();
}
