
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:budynok_slovo/main.dart';
import 'package:budynok_slovo/screens/products_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Перехід до каталогу книжок', (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Переглянути книжки'), findsOneWidget);

    await tester.tap(find.text('Переглянути книжки'));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(ProductsScreen), findsOneWidget);
  });
}
