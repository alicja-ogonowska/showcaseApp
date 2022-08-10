import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_cubit.freezed.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.tabSelected(0));

  void selectTab(int index) => emit(NavigationState.tabSelected(index));

  void selectFirstTab() => emit(const NavigationState.tabSelected(0));
}
