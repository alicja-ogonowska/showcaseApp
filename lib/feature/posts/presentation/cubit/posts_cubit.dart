import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
        super(const PostsState.initial()) {
    debugPrint('test');
  }

  final GetPostsUseCase _getPostsUseCase;

  Future<void> fetchPosts() async {
    emit(const PostsState.loading());

    final result = await _getPostsUseCase();

    emit(
      result.when(
        PostsState.loaded,
        failure: PostsState.failure,
      ),
    );
  }
}
