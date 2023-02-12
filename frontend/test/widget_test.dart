// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Required widgets in authentication choice page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MySpotify());

    final Finder loginButton = find.byKey(const Key("loginButton"));
    final Finder registerButton = find.byKey(const Key("registerButton"));
    final Finder title = find.text("My Spotify");

    expect(title, findsOneWidget);
    expect(loginButton, findsOneWidget);
    expect(registerButton, findsOneWidget);
  });
}
