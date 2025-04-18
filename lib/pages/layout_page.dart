// import 'package:flutter/material.dart';
// import 'package:flutter_buoi5/pages/cart_page.dart';
// import 'package:flutter_buoi5/pages/home_page.dart';
// import 'package:flutter_buoi5/widgets/custom_bottom_nav.dart';


// class LayoutPage  extends StatelessWidget {
//   const LayoutPage ({super.key});

//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(title: const Text("Layout Page"), centerTitle: true),
//       body: Navigator(
//         onGenerateRoute: (settings) {
//           // Định nghĩa các route để điều hướng từ LayoutPage
//           switch (settings.name) {
//             case '/':
//               return MaterialPageRoute(builder: (context) => const HomePage());
//             case '/cart':
//               return MaterialPageRoute(builder: (context) => const CartPage());
//             default:
//               return MaterialPageRoute(builder: (context) => const HomePage());
//           }
//         },
//       ),
//       bottomNavigationBar: CustomBottomNavBar(currentIndex: 0), // Giữ nav dưới
//     );
//   }
// }