import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/class_reminder_page.dart';
import 'package:front_end/main.dart';
import 'package:front_end/scheduler_page.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    group('Home Navigation tests', () {
      testWidgets('Home to ClassReminderPage', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const HomePage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("class_reminder_button")));
        await tester.pumpAndSettle();

        // ...and there should be a DetailsPage present in the widget tree...
        expect(find.byType(ClassReminderPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);
      });

      testWidgets('Home to GameSettings', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const HomePage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("scheduler_button")));
        await tester.pumpAndSettle();

        // ...and there should be a DetailsPage present in the widget tree...
        expect(find.byType(SchedulerPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);
      });
    });
    group('Scheduler Navigation tests', () {
      testWidgets('Scheduler to Home', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const SchedulerPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("home_button")));
        await tester.pumpAndSettle();

        // ...and there should be a DetailsPage present in the widget tree...
        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(SchedulerPage), findsNothing);
      });
    });
    group('Class Reminder Navigation tests', () {
      testWidgets('Class Reminder to Home', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ClassReminderPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("home_button")));
        await tester.pumpAndSettle();

        // ...and there should be a DetailsPage present in the widget tree...
        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(ClassReminderPage), findsNothing);
      });
    });
  });
}
