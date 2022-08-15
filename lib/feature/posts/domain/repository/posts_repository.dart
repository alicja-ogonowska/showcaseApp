import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';

abstract class PostsRepository {
  Future<Result<List<Post>>> getPosts();

  Future<Result<bool>> addPost(String title, String body);
}
