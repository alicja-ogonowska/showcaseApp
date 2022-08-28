import 'package:flutter_test/flutter_test.dart';
import 'package:showcase_app/feature/posts/presentation/widget/post_of_the_day.dart';

import '../test/util/test_actions.dart';
import 'app_launcher.dart';

void main() {
  testWidgets('Post of the day is displayed', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await launchHomeScreen(tester);
      findTypeWidget(PostOfTheDay).once();
    });
  });
}
