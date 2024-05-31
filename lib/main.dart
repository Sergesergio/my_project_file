import 'package:desco/module/shop.dart';
import 'package:desco/pages/cart_page.dart';
import 'package:desco/pages/intro_page.dart';
import 'package:desco/pages/shop_page.dart';
import 'package:desco/pages/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => Shop(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/Intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/intro_page': (context) => const IntroPage()
      },
    );
  }
}
