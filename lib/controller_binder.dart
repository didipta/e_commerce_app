import 'package:e_commerce_app/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
  }
}