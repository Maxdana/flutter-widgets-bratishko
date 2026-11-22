
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/product.dart';
import '../widgets/profile_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/animated_counter.dart';
import '../widgets/product_card.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  bool compact = false;
  bool loading = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const user = User(
      name: "РџРµС‚СЂРёРє Рџ'СЏС‚РѕС‡РєС–РЅ",
      email: 'Petruk@ukr.net',
      avatarPath: 'assets/images/Petruk.jpg',
    );

    const product = Product(
      id: '1',
      name: 'РЇ (Р РѕРјР°РЅС‚РёРєР°)',
      author: 'РњРёРєРѕР»Р° РҐРІРёР»СЊРѕРІРёР№',
      price: 150,
      imagePath: 'assets/images/romantyka.jpg',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Р”РµРјРѕРЅСЃС‚СЂР°С†С–СЏ РєРѕРјРїРѕРЅРµРЅС‚С–РІ')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Приклад: ProfileWidget(user: user, isCompact: true)
          SwitchListTile(
            title: const Text('РљРѕРјРїР°РєС‚РЅРёР№ СЂРµР¶РёРј'),
            value: compact,
            onChanged: (value) => setState(() => compact = value),
          ),
          ProfileWidget(user: user, isCompact: compact),

          // Приклад: CustomButton(text: 'РљРЅРѕРїРєР°', style: CustomButtonStyle.primary)
          ...CustomButtonStyle.values.map(
            (style) =>
                CustomButton(text: style.name, style: style, onPressed: () {}),
          ),

          SwitchListTile(
            title: const Text('Р—Р°РІР°РЅС‚Р°Р¶РµРЅРЅСЏ'),
            value: loading,
            onChanged: (value) => setState(() => loading = value),
          ),
          CustomButton(
            text: 'Р—Р°РІР°РЅС‚Р°Р¶РµРЅРЅСЏ',
            isLoading: loading,
            onPressed: () {},
          ),

          // Приклад: ProductCard(product: product)
          ProductCard(
            product: product,
            isFavorite: isFavorite,
            onFavoriteToggle: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            onAddToCart: () {},
          ),

          const SizedBox(height: 30),

          const Text(
            'Р›С–С‡РёР»СЊРЅРёРє РєРѕС€РёРєР°',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Приклад: AnimatedCounter(initialValue: 0, maxValue: 10)
          const AnimatedCounter(
            initialValue: 0,
            maxValue: 10,
          ),
        ],
      ),
    );
  }
}
