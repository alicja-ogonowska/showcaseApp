import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findTextWidget(String str) => find.text(str);

Finder findIconWidget(IconData icon) =>
    find.byWidgetPredicate((widget) => widget is Icon && widget.icon == icon);

Finder findFormFieldByHint(String str) => find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          widget.decoration!.hintText != null &&
          widget.decoration!.hintText == str,
    );

Finder findFormFieldByHintAndIsObscured(
  String str, {
  required bool isObscured,
}) =>
    find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          widget.decoration!.hintText != null &&
          widget.decoration!.hintText == str &&
          widget.obscureText == isObscured,
    );

Finder findFormFieldTitleWidget(String str) => find.byWidgetPredicate(
      (widget) => widget is RichText && widget.text.toPlainText() == str,
);

Finder findFormFieldByTitle(String str) {
  final Finder titleTextFinder = findFormFieldTitleWidget(str);
  final Finder columnParentFinder =
      find.ancestor(of: titleTextFinder, matching: find.byType(Column)).first;
  return find.descendant(
    of: columnParentFinder,
    matching: find.byType(TextField),
  );
}

Future<void> enterText(
  WidgetTester tester,
  Finder formField,
  String text

) async {
  await tester.enterText(formField, text);
  await tester.pump();
}

Future<void> tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pump();
}

extension FinderMatchExtension on Finder {
  void never() => expect(this, findsNothing);

  void once() => expect(this, findsOneWidget);

  void times(int n) => expect(this, findsNWidgets(n));
}
