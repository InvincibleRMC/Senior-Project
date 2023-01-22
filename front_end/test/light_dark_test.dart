import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/main.dart';

void main() {
  group('Light Dark Mode Tests', () {
    const IconData night = Icons.brightness_2;
    const IconData light = Icons.wb_sunny;
    testWidgets('Starting State Dark', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byIcon(light), findsOneWidget);
      expect(find.byIcon(night), findsNothing);
    });
    testWidgets('Night to Light', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(light));
      await tester.pump();

      expect(find.byIcon(light), findsNothing);
      expect(find.byIcon(night), findsOneWidget);
    });
    testWidgets('Light to Night', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(light));
      await tester.pump();

      //Asert Light
      expect(find.byIcon(light), findsNothing);
      expect(find.byIcon(night), findsOneWidget);

      await tester.tap(find.byIcon(night));
      await tester.pump();

      expect(find.byIcon(light), findsOneWidget);
      expect(find.byIcon(night), findsNothing);
    });
  });
}
