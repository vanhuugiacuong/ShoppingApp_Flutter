import 'package:flutter/material.dart';
import 'package:flutter_buoi5/pages/cart_page.dart';
import 'package:flutter_buoi5/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_buoi5/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF1DB954),
          scaffoldBackgroundColor:  Colors.white,
        ),
        initialRoute: '/', // Trang bắt đầu
        routes: {
          '/':
              (context) =>
                  const HomePage(), // Chỉ định LayoutPage làm trang chủ
          '/cart':
              (context) => const CartPage(), // Định nghĩa route cho CartPage
        },
      ),
    );
  }
}

