import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/profile/domain/entity/user.dart';

abstract class UserRepository {
  Future<Result<User?>> checkAuthenticatedUser();

  Future<Result<User>> login(String email, String password);

  Future<Result<void>> logout();
}
