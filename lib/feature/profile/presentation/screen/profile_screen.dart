import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/feature/profile/presentation/bloc/user_cubit.dart';
import 'package:showcase_app/feature/profile/presentation/widget/login_form.dart';
import 'package:showcase_app/l10n/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.profile),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return state.whenOrNull(
                  authenticated: (authenticated) => _AuthenticatedUserView(),
                ) ??
                _UnauthenticatedUserView();
          },
        ),
      ),
    );
  }
}

class _AuthenticatedUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () => context.read<UserCubit>().logout(),
        child: Text(context.l10n.logout),
      ),
    );
  }
}

class _UnauthenticatedUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            context.l10n.loginToYourAccount,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        LoginForm(
          onLogin: (email, password) => _onLogin(context, email, password),
        ),
      ],
    );
  }

  void _onLogin(BuildContext context, String email, String password) {
    context.read<UserCubit>().login(email, password);
  }
}
