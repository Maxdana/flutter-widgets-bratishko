
import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'products_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final AppState appState;

  const HomeScreen({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2B6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Text(
                'Будинок «Слово»',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF263E30),
                  fontFamily: 'serif',
                ),
              ),
              const Spacer(flex: 2),
              const Text(
                'Зануртесь у думки тих, кого радянська влада '
                'вважала своїм ворогом, тих хто мав би бути, '
                'але не зміг, тих кому не дали бути.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF39B879),
                  height: 1.5,
                  fontFamily: 'serif',
                ),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF263E30),
                    foregroundColor: const Color(0xFFF0F2B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductsScreen(appState: appState),
                      ),
                    );
                  },
                  child: const Text('Переглянути книжки'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF263E30),
                    foregroundColor: const Color(0xFFF0F2B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProfileScreen(),
                      ),
                    );
                  },
                  child: const Text('Профіль'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
