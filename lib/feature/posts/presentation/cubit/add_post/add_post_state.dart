part of 'add_post_cubit.dart';

@freezed
class AddPostState with _$AddPostState {
  const factory AddPostState.initial() = AddPostInitialState;

  const factory AddPostState.loading() = AddPostLoadingState;

  const factory AddPostState.success() = AddPostSuccessState;

  const factory AddPostState.failure(Failure failure) = AddPostFailedState;
}
