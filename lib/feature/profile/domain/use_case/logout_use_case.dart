import 'package:injectable/injectable.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/base/domain/use_case/use_case.dart';
import 'package:showcase_app/feature/profile/domain/repository/user_repository.dart';

@injectable
class LogoutUseCase extends AsyncUseCaseWithoutParams<void> {
  const LogoutUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Result<void>> call() async {
    return _repository.logout();
  }
}
