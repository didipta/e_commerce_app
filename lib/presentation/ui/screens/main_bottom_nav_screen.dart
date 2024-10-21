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
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navBarController.selectedIndex,
          onDestinationSelected: _navBarController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist',
            ),
          ],
        ),

      );
    });
  }
}
