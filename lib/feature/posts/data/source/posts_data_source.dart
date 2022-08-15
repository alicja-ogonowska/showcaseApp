import 'package:showcase_app/feature/posts/data/model/post_model.dart';

abstract class PostsDataSource {
  Future<List<PostModel>> getPosts();

  Future<bool> addPost(String title, String body);
}
