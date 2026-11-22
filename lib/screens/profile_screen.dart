
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
      appBar: AppBar(
        title: const Text('Профіль'),
      ),
      body: Center(
        child: ProfileWidget(user: user),
      ),
    );
  }
}
