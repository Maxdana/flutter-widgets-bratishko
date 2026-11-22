
import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  final VoidCallback? onEditPressed;
  final bool isCompact;

  const ProfileWidget({
    super.key,
    required this.user,
    this.onEditPressed,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: isCompact ? 30 : 50,
              backgroundImage: AssetImage(user.avatarPath),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF263E30),
                fontFamily: 'serif',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF263E30),
              ),
            ),
            if (!isCompact && onEditPressed != null)
              TextButton(
                onPressed: onEditPressed,
                child: const Text('Редагувати'),
              ),
          ],
        ),
      ),
    );
  }
}
