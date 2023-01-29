import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/class_reminder_page.dart';
import 'package:front_end/main.dart';
import 'package:front_end/results.dart';
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

        expect(find.byType(ClassReminderPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);
      });

      testWidgets('Home to Scheduler', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const HomePage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("scheduler_button")));
        await tester.pumpAndSettle();

        expect(find.byType(SchedulerPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);
      });
    });
    group('Scheduler Navigation tests', () {
      testWidgets('Scheduler to Results', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const SchedulerPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        //Without entering Major should remain on same page
        await tester.tap(find.byKey(const Key("submit_button")));
        await tester.pumpAndSettle();
        expect(find.byType(SchedulerPage), findsOneWidget);
        expect(find.byType(ResultsPage), findsNothing);

        //Remove Pop Up to return to starting state
        await tester.tap(find.byKey(const Key("ok_button")));
        await tester.pumpAndSettle();

        //Open Drop Down Search Bar
        await tester.tap(find.byKey(const Key("drop_down_search_major")));
        await tester.pumpAndSettle();

        //With Major entered allow acess to Results Page
        await tester.tap(find.text("CS BS"));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key("submit_button")));
        await tester.pumpAndSettle();

        expect(find.byType(ResultsPage), findsOneWidget);
        expect(find.byType(SchedulerPage), findsNothing);
      });
    });
    group('Class Reminder Navigation tests', () {
      testWidgets('Class Reminder to Home Ignore Warning',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ClassReminderPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        // Hit submit but no email provided
        await tester.tap(find.byKey(const Key("submit_button")));
        await tester.pumpAndSettle();

        expect(find.byType(ClassReminderPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);

        //Ignore warning and return to Home
        await tester.tap(find.byKey(const Key("continue_anyway_button")));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(ClassReminderPage), findsNothing);
      });
      testWidgets('Class Reminder to Home Listen to Warning',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ClassReminderPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        // Hit submit but no email provided
        await tester.tap(find.byKey(const Key("submit_button")));
        await tester.pumpAndSettle();

        expect(find.byType(ClassReminderPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);

        //Cancel Submission
        await tester.tap(find.byKey(const Key("cancel_button")));
        await tester.pumpAndSettle();

        expect(find.byType(ClassReminderPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);

        //Cancel Submission
        await tester.enterText(
            find.byKey(const Key("email_input_field")), "test@test.com");
        await tester.pumpAndSettle();

        // Hit submit but email provided
        await tester.tap(find.byKey(const Key("submit_button")));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(ClassReminderPage), findsNothing);
      });
    });
    group('Results Navigation tests', () {
      testWidgets('Results to Home', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ResultsPage(),

          // This mocked observer will now receive all navigation events
          // that happen in our app.
          navigatorObservers: [mockObserver],
        ));

        await tester.tap(find.byKey(const Key("home_button")));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(ResultsPage), findsNothing);
      });
    });
  });
}
