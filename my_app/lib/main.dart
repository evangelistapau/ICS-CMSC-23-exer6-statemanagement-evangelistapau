import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/cart.dart';
import 'screen/catalog.dart';
import 'provider/shoppingcart.dart';
import 'screen/checkout.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart())
      ], 
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 55, 0, 136)),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const Catalog());
        }
        else if (settings.name == '/cart') {
          return MaterialPageRoute(builder: (context) => const Cart());
        }
        else if (settings.name == '/checkout') { 
          return MaterialPageRoute(builder: (context) => const Checkout());
        }
      },
    );
  }
}
