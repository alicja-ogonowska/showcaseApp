import 'package:injectable/injectable.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/base/domain/use_case/params.dart';
import 'package:showcase_app/base/domain/use_case/use_case.dart';
import 'package:showcase_app/feature/profile/domain/entity/user.dart';
import 'package:showcase_app/feature/profile/domain/repository/user_repository.dart';

@injectable
class LoginUseCase extends AsyncUseCaseWithParams<User, LoginParams> {
  const LoginUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Result<User>> call(LoginParams params) async {
    return _repository.login(params.email, params.password);
  }
}

class LoginParams extends Params {
  const LoginParams(
    this.email,
    this.password,
  );

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
