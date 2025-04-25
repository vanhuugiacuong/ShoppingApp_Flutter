import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const CustomBottomNavBar({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // Không chuyển nếu đang ở trang hiện tại

    // Điều hướng qua pushReplacementNamed
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/cart');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: NavigationRail(
                onDestinationSelected: (index) => _onItemTapped(context, index),
                backgroundColor: Colors.transparent,
                selectedIconTheme: IconThemeData(
                  color: Theme.of(context).primaryColor,
                ),
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                selectedLabelTextStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
                unselectedLabelTextStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart_outlined),
                    selectedIcon: Icon(Icons.shopping_cart),
                    label: Text('Cart'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outlined),
                    selectedIcon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ], selectedIndex: null,
              ),
            ),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar:
          isDesktop
              ? null
              : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index) => _onItemTapped(context, index),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: "Trang Chủ",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      activeIcon: Icon(Icons.shopping_cart),
                      label: "Giỏ Hàng",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outlined),
                      activeIcon: Icon(Icons.person),
                      label: "Thông Tin",
                    ),
                  ],
                ),
              ),
    );
  }
}
