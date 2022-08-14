import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcase_app/common/presentation/widget/button.dart';
import 'package:showcase_app/feature/profile/domain/entity/user.dart';
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
        backgroundColor: Colors.white,
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return state.whenOrNull(
                  authenticated: (user) => _AuthenticatedUserView(user!),
                ) ??
                _UnauthenticatedUserView();
          },
        ),
      ),
    );
  }
}

class _AuthenticatedUserView extends StatelessWidget {
  const _AuthenticatedUserView(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          context.l10n.goodToSeeYou(user.name),
          style: GoogleFonts.patrickHand(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const Image(image: AssetImage('assets/welcome.webp')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Button(
            child: Text(context.l10n.logout),
            onPressed: () => context.read<UserCubit>().logout(),
          ),
        ),
      ],
    );
  }
}

class _UnauthenticatedUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              context.l10n.loginToYourAccount,
              style: GoogleFonts.patrickHand(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const Image(image: AssetImage('assets/login.webp')),
          LoginForm(
            onLogin: (email, password) => _onLogin(context, email, password),
          ),
        ],
      ),
    );
  }

  void _onLogin(BuildContext context, String email, String password) {
    context.read<UserCubit>().login(email, password);
  }
}
