
import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'products_screen.dart';

class HomeScreen extends StatelessWidget {
  final AppState appState;

const HomeScreen({
  super.key,
  required this.appState,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Будинок «Слово»'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Будинок «Слово»',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Text(
              'Зануртесь у думки тих, кого радянська влада '
              'вважала своїм ворогом, тих хто мав би бути, '
              'але не зміг, тих кому не дали бути.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsScreen(appState: appState),
      ),
    );
  },
  child: const Text('Переглянути книжки'),
),
          ],
        ),
      ),
    );
  }
}
