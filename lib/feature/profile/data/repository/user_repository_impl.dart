import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source.dart';
import 'package:showcase_app/feature/profile/domain/entity/user.dart';
import 'package:showcase_app/feature/profile/domain/repository/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserDataSource dataSource,
    required Logger logger,
  })  : _dataSource = dataSource,
        _logger = logger;

  final UserDataSource _dataSource;
  final Logger _logger;

  @override
  Future<Result<User?>> checkAuthenticatedUser() async {
    try {
      final model = await _dataSource.checkAuthenticatedUser();
      final user = model != null
          ? User(
              name: model.name,
              id: model.id,
              email: model.email,
            )
          : null;
      return Result(user);
    } catch (e, s) {
      _logger.e('Checking authenticated user has failed', e, s);
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<User>> login(String email, String password) async {
    try {
      final model = await _dataSource.login(email, password);
      return Result(
        User(
          name: model.name,
          id: model.id,
          email: model.email,
        ),
      );
    } catch (e, s) {
      _logger.e('Login has failed', e, s);
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _dataSource.logout();
      return const Result(null);
    } catch (e, s) {
      _logger.e('Logout has failed', e, s);
      return Result.failure(Failure(e, s));
    }
  }
}
