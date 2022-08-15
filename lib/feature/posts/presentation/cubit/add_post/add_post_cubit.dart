import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/posts/domain/use_case/add_post_use_case.dart';

part 'add_post_cubit.freezed.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({
    required AddPostUseCase addPostUseCase,
  })  : _addPostUseCase = addPostUseCase,
        super(const AddPostState.initial());

  final AddPostUseCase _addPostUseCase;

  Future<void> addPost(String title, String content) async {
    emit(const AddPostState.loading());

    final result = await _addPostUseCase(AddPostParams(title, content));

    emit(
      result.when(
        (_) => const AddPostState.success(),
        failure: AddPostState.failure,
      ),
    );
  }
}
