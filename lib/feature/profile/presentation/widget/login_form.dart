import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/feature/profile/presentation/bloc/user_cubit.dart';
import 'package:showcase_app/feature/profile/presentation/widget/form_text_field.dart';
import 'package:showcase_app/l10n/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onLogin,
  });

  @override
  _LoginFormState createState() => _LoginFormState();

  final Function(
    String email,
    String password,
  ) onLogin;
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late GlobalKey<FormState> _loginFormKey;
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _loginFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            FormTextField(
              textInputType: TextInputType.emailAddress,
              title: context.l10n.email,
              controller: _emailController,
              focusNode: _emailFocusNode,
              nextFocusNode: _passwordFocusNode,
              //  validator: _addressValidator.validateEmail,
            ),
            const SizedBox(height: 16),
            FormTextField(
              textInputType: TextInputType.visiblePassword,
              isObscured: isObscured,
              title: context.l10n.password,
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _submitLogin(),
              focusNode: _passwordFocusNode,
              validator: (String? password) {
                return (password?.length ?? 0) < 6
                    ? context.l10n.passwordTooShort
                    : null;
              },
              suffix: GestureDetector(
                onTap: () => setState(
                  () {
                    isObscured = !isObscured;
                  },
                ),
                child: Text(
                  (isObscured ? context.l10n.show : context.l10n.hide)
                      .toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) => OutlinedButton(
                onPressed: _submitLogin,
                child: state.whenOrNull(
                      loading: (_) => const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ) ??
                    Text(context.l10n.login),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitLogin() {
    FocusScope.of(context).unfocus();
    final formValidated = _loginFormKey.currentState?.validate() ?? false;
    if (formValidated) {
      widget.onLogin(
        _emailController.text,
        _passwordController.text,
      );
    }
  }
}
