part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.unauthenticated(User? user) = UserUnathenticatedState;

  const factory UserState.loading(User? user) = UserLoadingState;

  const factory UserState.authenticated(User? user) = UserAuthenticatedState;

  const factory UserState.failure(User? user, Failure failure) =
      UserFailureState;
}
