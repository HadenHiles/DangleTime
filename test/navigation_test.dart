import 'package:dangletime/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Navigation is present', (WidgetTester tester) async {
    await tester.pumpWidget(Navigation());

    expect(find.text('Home'), findsOneWidget);
  });

  // testWidgets('Navigation is present and triggers navigation for each tab after tapped', (WidgetTester tester) async {
  //   final mockObserver = MockNavigatorObserver();
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: DangleTime(),
  //       navigatorObservers: [mockObserver],
  //     ),
  //   );

  //   /**
  //    * Friends Navigation Test
  //    */
  //   expect(find.widgetWithIcon(BottomNavigationBarItem, Icons.people), findsOneWidget);
  //   await tester.tap(find.widgetWithIcon(BottomNavigationBarItem, Icons.people));
  //   await tester.pumpAndSettle();

  //   /// Verify that a push event happened
  //   verify(mockObserver.didPush(any, any));

  //   // Ensure friends page is successfully displayed
  //   expect(find.byType(Friends), findsOneWidget);
  // });
}
