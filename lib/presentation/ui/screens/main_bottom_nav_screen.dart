import 'package:e_commerce_app/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final BottomNavBarController _navBarController =
  Get.find<BottomNavBarController>();

  final List<Widget> _screens = const [
   Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Category Screen'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Cart Screen'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Wishlist Screen'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (_) {
      return Scaffold(
        body: _screens[_navBarController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
          ],
        ),
      );
    });
  }
}
