import 'package:injectable/injectable.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/base/domain/use_case/params.dart';
import 'package:showcase_app/base/domain/use_case/use_case.dart';
import 'package:showcase_app/feature/posts/domain/repository/posts_repository.dart';

@injectable
class AddPostUseCase extends AsyncUseCaseWithParams<bool, AddPostParams> {
  const AddPostUseCase({
    required PostsRepository repository,
  }) : _repository = repository;

  final PostsRepository _repository;

  @override
  Future<Result<bool>> call(AddPostParams params) async {
    return _repository.addPost(params.title, params.body);
  }
}

class AddPostParams extends Params {
  const AddPostParams(this.title, this.body);

  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body];
}
