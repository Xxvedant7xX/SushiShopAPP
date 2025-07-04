import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/cart_page.dart';
import 'package:sushishop/pages/intro_page.dart';
import 'package:sushishop/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(), 
    child: const MyApp(),
    ),
    );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/menupage':(context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}