import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../util/main_screen_launcher.dart';
import '../../../../util/test_actions.dart';

void main() {
  const String correctEmail = 'example@example.com';
  const String correctPassword = 'password';
  const String incorrectEmail = 'test@e';
  const String tooShortPassword = 'pass';

  group('Profile screen', () {
    group('For logged in user', () {
      testWidgets(
        'should display user name greeting and logout button',
        (tester) async {
          final Widget widget = await getMainScreenWidget(
            tester,
            loggedIn: true,
          );

          await launchTab(tester, widget, TabName.profile);

          findTextWidget('Good to see you again, User!').once();

          await tap(tester, findTextWidget('Logout'));

          findTextWidget('Good to see you again, User!').never();
          findTextWidget('Login to your account').once();
        },
      );
    });
    group('For not logged in user', () {
      testWidgets(
        'For not logged in user should display login form and login user '
        'with correct credentials using login button',
        (tester) async {
          mockNetworkImagesFor(
            () async {
              final Widget widget = await getMainScreenWidget(tester);

              await launchTab(tester, widget, TabName.profile);

              // await scrollDownToView(tester, findTextWidget('Login to your account'));
              findTextWidget('Login to your account').once();

              await enterText(
                tester,
                findFormFieldByHint('E-mail'),
                correctEmail,
              );
              await enterText(
                tester,
                findFormFieldByHint('Password'),
                correctPassword,
              );

              await tap(tester, findTextWidget('Login'));
              await waitForAnimations(tester);

              findTextWidget('Login to your account').never();
              findTextWidget('Good to see you again, Example!').once();
            },
          );
        },
      );
      testWidgets(
        'should display login form and login user with correct credentials '
        'using soft keyboard submit button',
        (tester) async {
          mockNetworkImagesFor(
            () async {
              final Widget widget = await getMainScreenWidget(tester);

              await launchTab(tester, widget, TabName.profile);

              findTextWidget('Login to your account').once();

              await enterText(
                tester,
                findFormFieldByHint('E-mail'),
                correctEmail,
              );
              await enterText(
                tester,
                findFormFieldByHint('Password'),
                correctPassword,
              );

              await tester.testTextInput.receiveAction(TextInputAction.done);
              await waitForAnimations(tester);

              findTextWidget('Login to your account').never();
              findTextWidget('Good to see you again, Example!').once();
            },
          );
        },
      );
      testWidgets(
        'should display login form and display errors for invalid '
        'credentials',
        (tester) async {
          mockNetworkImagesFor(
            () async {
              final Widget widget = await getMainScreenWidget(tester);

              await launchTab(tester, widget, TabName.profile);

              findTextWidget('Login to your account').once();

              await enterText(
                tester,
                findFormFieldByHint('E-mail'),
                incorrectEmail,
              );
              await enterText(
                tester,
                findFormFieldByHint('Password'),
                tooShortPassword,
              );

              findTextWidget('Please provide valid e-mail address.').once();
              findTextWidget(
                'Your password is too short. It should be at least 6 characters '
                'long.',
              ).once();
            },
          );
        },
      );
      testWidgets(
        'should show obscured password by default and show it if requested',
        (tester) async {
          mockNetworkImagesFor(
            () async {
              final Widget widget = await getMainScreenWidget(tester);

              await launchTab(tester, widget, TabName.profile);

              findTextWidget('Login to your account').once();

              await enterText(
                tester,
                findFormFieldByHint('E-mail'),
                correctEmail,
              );
              await enterText(
                tester,
                findFormFieldByHint('Password'),
                correctPassword,
              );

              findFormFieldByHintAndIsObscured('Password', isObscured: true)
                  .once();

              await tap(tester, findTextWidget('SHOW'));
              findFormFieldByHintAndIsObscured('Password', isObscured: true)
                  .never();
              await tap(tester, findTextWidget('HIDE'));
              findFormFieldByHintAndIsObscured('Password', isObscured: true)
                  .once();
            },
          );
        },
      );
    });
  });
}
