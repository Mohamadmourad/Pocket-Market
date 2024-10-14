import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/pages/cart_page.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/loading.dart';
import 'package:frontend/pages/order_info_page.dart';
import 'package:frontend/pages/payment_checkout.dart';
import 'package:frontend/pages/product_page.dart';
import 'package:frontend/pages/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/product': (context) => const ProductPage(),
          '/cart': (context) => const CartPage(),
          '/order': (context) => const OrderInfo(),
          '/payment': (context) => const PaymentCheckout(),
          '/search': (context) => const SearchPage(),
        },
      ),
    );
  }
}
