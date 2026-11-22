
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budynok_slovo/models/user.dart';
import 'package:budynok_slovo/widgets/profile_widget.dart';

void main() {
  const user = User(
    name: "Петрик П'яточкін",
    email: 'Petruk@ukr.net',
    avatarPath: 'assets/images/Petruk.jpg',
  );

  group('ProfileWidget Tests', () {
    testWidgets('should show user name and email', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfileWidget(user: user),
          ),
        ),
      );

      expect(find.text("Петрик П'яточкін"), findsOneWidget);
      expect(find.text('Petruk@ukr.net'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('should show edit button', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileWidget(
              user: user,
              onEditPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Редагувати'));

      expect(pressed, true);
    });

    testWidgets('should hide edit button in compact mode', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfileWidget(
              user: user,
              isCompact: true,
            ),
          ),
        ),
      );

      expect(find.text("Петрик П'яточкін"), findsOneWidget);
      expect(find.text('Редагувати'), findsNothing);
    });
  });
}
