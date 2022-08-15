import 'package:flutter_test/flutter_test.dart';

Finder findTextWidget(String str) => find.text(str);

extension FinderMatchExtension on Finder {
  void never() => expect(this, findsNothing);

  void once() => expect(this, findsOneWidget);

  void times(int n) => expect(this, findsNWidgets(n));
}
