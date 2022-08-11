import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/feature/profile/domain/entity/user.dart';
import 'package:showcase_app/feature/profile/domain/use_case/check_authenticated_user_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/login_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/logout_use_case.dart';

part 'user_cubit.freezed.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required LoginUseCase loginUseCase,
    required CheckAuthenticatedUserUseCase checkAuthenticatedUserUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _checkAuthenticatedUserUseCase = checkAuthenticatedUserUseCase,
        _logoutUseCase = logoutUseCase,
        super(const UserState.unauthenticated(null));

  final LoginUseCase _loginUseCase;
  final CheckAuthenticatedUserUseCase _checkAuthenticatedUserUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> checkAuthenticatedUser() async {
    emit(UserState.loading(state.user));
    final result = await _checkAuthenticatedUserUseCase();
    emit(
      result.when(
        UserState.authenticated,
        failure: (failure) => const UserState.unauthenticated(null),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    emit(UserState.loading(state.user));
    final result = await _loginUseCase(
      LoginParams(
        email,
        password,
      ),
    );
    emit(
      result.when(
        UserState.authenticated,
        failure: (failure) => const UserState.unauthenticated(null),
      ),
    );
  }

  Future<void> logout() async {
    emit(UserState.loading(state.user));
    final result = await _logoutUseCase();
    emit(
      result.map(
        (value) => const UserState.unauthenticated(null),
        failure: (failure) => const UserState.unauthenticated(null),
      ),
    );
  }
}
