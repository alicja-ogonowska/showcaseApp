import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/posts/data/source/posts_data_source.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/feature/posts/domain/repository/posts_repository.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl({
    required PostsDataSource dataSource,
    required Logger logger,
  })  : _dataSource = dataSource,
        _logger = logger;

  final PostsDataSource _dataSource;
  final Logger _logger;

  @override
  Future<Result<List<Post>>> getPosts() async {
    try {
      final postModels = await _dataSource.getPosts();

      final posts = postModels
          .map(
            (model) => Post(
              id: model.id,
              title: model.title,
              body: model.body,
              userId: model.userId,
            ),
          )
          .toList();

      return Result(posts);
    } catch (e, s) {
      _logger.e('Getting posts has failed', e, s);
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<bool>> addPost(String title, String body) async {
    try {
      final postAdded = await _dataSource.addPost(title, body);

      return postAdded
          ? const Result(true)
          : const Result.failure(Failure('Adding new post has failed'));
    } catch (e, s) {
      _logger.e('Adding new post has failed', e, s);
      return Result.failure(Failure(e, s));
    }
  }
}
