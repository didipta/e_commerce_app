import 'package:e_commerce_app/controller_binder.dart';
import 'package:e_commerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ecommerceapp extends StatefulWidget {
  const ecommerceapp({super.key});

  @override
  State<ecommerceapp> createState() => _ecommerceappState();
}

class _ecommerceappState extends State<ecommerceapp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
    );
  }
}
