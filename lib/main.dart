import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/pages/home_screen.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';

import 'pages/cart_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/cart': (context) => CartScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // Your app's theme
          ),
      home: const HomeScreen(),
    );
  }
}
