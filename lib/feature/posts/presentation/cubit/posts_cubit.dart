import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/feature/posts/domain/use_case/get_posts_use_case.dart';

part 'posts_cubit.freezed.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required GetPostsUseCase getPostsUseCase,
  })  : _getPostsUseCase = getPostsUseCase,
        super(const PostsState.initial());

  final GetPostsUseCase _getPostsUseCase;

  Future<void> fetchPosts() async {
    emit(const PostsState.loading());

    final result = await _getPostsUseCase();

    emit(
      result.when(
        (posts) => PostsState.loaded(posts, _getPostOfTheDay(posts)),
        failure: PostsState.failure,
      ),
    );
  }

  Post? _getPostOfTheDay(List<Post> posts) {
    if (posts.isEmpty) {
      return null;
    }
    final randomIndex = Random().nextInt(posts.length - 1);
    return posts[randomIndex];
  }
}
