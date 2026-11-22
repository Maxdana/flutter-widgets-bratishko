
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budynok_slovo/widgets/animated_counter.dart';

void main() {
  group('AnimatedCounter Tests', () {
    testWidgets('should show initial value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCounter(initialValue: 2, maxValue: 10),
          ),
        ),
      );

      expect(find.text('2 / 10'), findsOneWidget);
    });

    testWidgets('should increase and decrease value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCounter(maxValue: 10),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('1 / 10'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      expect(find.text('0 / 10'), findsOneWidget);
    });

    testWidgets('should not exceed maximum value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCounter(initialValue: 2, maxValue: 2),
          ),
        ),
      );

      expect(find.text('2 / 2'), findsOneWidget);

      final addButton = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.add),
      );

      expect(addButton.onPressed, isNull);
    });
  });
}
