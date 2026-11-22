import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/profile_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/animated_counter.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  bool compact = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    const user = User(
      name: "Петрик П'яточкін",
      email: 'Petruk@ukr.net',
      avatarPath: 'assets/images/Petruk.jpg',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Демонстрація компонентів')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Приклад: ProfileWidget(user: user, isCompact: true)
          SwitchListTile(
            title: const Text('Компактний режим'),
            value: compact,
            onChanged: (value) => setState(() => compact = value),
          ),
          ProfileWidget(user: user, isCompact: compact),

          // Приклад: CustomButton(text: 'Кнопка', style: CustomButtonStyle.primary)
          ...CustomButtonStyle.values.map(
            (style) =>
                CustomButton(text: style.name, style: style, onPressed: () {}),
          ),

          SwitchListTile(
            title: const Text('Завантаження'),
            value: loading,
            onChanged: (value) => setState(() => loading = value),
          ),
          CustomButton(
            text: 'Завантаження',
            isLoading: loading,
            onPressed: () {},
          ),
const SizedBox(height: 30),

const Text(
  'Лічильник кошика',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 16),

const AnimatedCounter(
  initialValue: 0,
  maxValue: 10,
),




        ],
      ),
    );
  }
}
