// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dangletime/tabs/Friends.dart';
import 'package:dangletime/tabs/Home.dart';
import 'package:dangletime/tabs/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dangletime/main.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() async {
  testWidgets('Navigation is present and triggers navigation for each tab after tapped', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: DangleTime(),
        navigatorObservers: [mockObserver],
      ),
    );

    /**
     * Home Navigation Test
     */
    expect(find.widgetWithText(BottomNavigationBarItem, "Home"), findsOneWidget);
    await tester.tap(find.widgetWithText(BottomNavigationBarItem, "Home"));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any, any));

    // Ensure home page is successfully displayed
    expect(find.byType(Home), findsOneWidget);

    /**
     * Friends Navigation Test
     */
    expect(find.widgetWithText(BottomNavigationBarItem, "Friends"), findsOneWidget);
    await tester.tap(find.widgetWithText(BottomNavigationBarItem, "Friends"));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any, any));

    // Ensure friends page is successfully displayed
    expect(find.byType(Friends), findsOneWidget);

    /**
     * Profile Navigation Test
     */
    expect(find.widgetWithText(BottomNavigationBarItem, "Profile"), findsOneWidget);
    await tester.tap(find.widgetWithText(BottomNavigationBarItem, "Profile"));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any, any));

    // Ensure profile page is successfully displayed
    expect(find.byType(Profile), findsOneWidget);
  });
}
