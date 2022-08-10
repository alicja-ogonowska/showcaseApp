import 'package:injectable/injectable.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/base/domain/use_case/use_case.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/feature/posts/domain/repository/posts_repository.dart';

@injectable
class GetPostsUseCase extends AsyncUseCaseWithoutParams<List<Post>> {
  const GetPostsUseCase({
    required PostsRepository repository,
  }) : _repository = repository;

  final PostsRepository _repository;

  @override
  Future<Result<List<Post>>> call() async {
    return _repository.getPosts();
  }
}
