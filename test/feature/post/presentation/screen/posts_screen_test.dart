import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../util/main_screen_launcher.dart';
import '../../../../util/test_actions.dart';

void main() {
  group('Posts screen', () {
    testWidgets('should display title', (tester) async {
      final Widget widget = await getMainScreenWidget(tester);

      await launchTab(tester, widget, TabName.posts);
      findTextWidget('Check what other users are talking about!').once();
    });

    testWidgets('should display error message when request fails',
        (tester) async {
      final Widget widget = await getMainScreenWidget(tester);

      await launchTab(tester, widget, TabName.posts);
      findTextWidget('Oops, something went wrong!').once();
    });
  });
}
