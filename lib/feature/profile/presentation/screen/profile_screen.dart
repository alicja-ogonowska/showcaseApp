import 'package:flutter/material.dart';
import 'package:showcase_app/feature/profile/presentation/widget/login_form.dart';
import 'package:showcase_app/l10n/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
      ),
      body: Column(
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
          LoginForm(onLogin: _onLogin),
        ],
      ),
    );
  }

  void _onLogin(String email, String password) {}
}
