part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.tabSelected(int index) =
      NavigationTabSelectedState;
}
