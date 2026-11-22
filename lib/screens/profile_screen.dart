
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const user = User(
      name: "Петрик П'яточкін",
      email: 'Petruk@ukr.net',
      avatarPath: 'assets/images/Petruk.jpg',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2B6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F2B6),
        foregroundColor: const Color(0xFF263E30),
        title: const Text('ПРОФІЛЬ'),
      ),
      body: Center(
        child: ProfileWidget(user: user),
      ),
    );
  }
}
