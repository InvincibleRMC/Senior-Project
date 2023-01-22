import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/main.dart';
import 'package:system_theme/system_theme.dart';

void main() {
  group('Light Dark Mode Tests', () {
    const IconData night = Icons.brightness_2;
    const IconData light = Icons.wb_sunny;
    testWidgets('Starting State', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final bool darkMode = SystemTheme.isDarkMode;

      // Asserts Correct widget
      if (darkMode) {
        expect(find.byIcon(night), findsOneWidget);
      } else {
        expect(find.byIcon(light), findsOneWidget);
      }
    });
    testWidgets('Night to Light', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(light));
      await tester.pump();

      //Asert Night
      expect(find.byIcon(night), findsOneWidget);
      expect(find.byIcon(light), findsNothing);

      await tester.tap(find.byIcon(night));
      await tester.pump();

      expect(find.byIcon(night), findsNothing);
      expect(find.byIcon(light), findsOneWidget);
    });
    testWidgets('Light to Night', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      //Asert Light
      expect(find.byIcon(night), findsNothing);
      expect(find.byIcon(light), findsOneWidget);

      await tester.tap(find.byIcon(light));
      await tester.pump();

      expect(find.byIcon(night), findsOneWidget);
      expect(find.byIcon(light), findsNothing);
    });
  });
}
