part of 'posts_cubit.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = PostsInitialState;

  const factory PostsState.loading() = PostsLoadingState;

  const factory PostsState.loaded(List<Post> posts) = PostsLoadedState;

  const factory PostsState.failure(Failure failure) = PostsStateFailedState;
}