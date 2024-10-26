
import 'package:e_commerce_app/presentation/ui/screens/payment_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/add_to_cart_controller.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}



class _CartScreenState extends State<CartScreen> {
  String totalPrice = '0.0';
  final AddToCartController _addToCartController =
  Get.find<AddToCartController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AddToCartController>().getCartList();
    });
    setState(() {
      totalPrice = _addToCartController.productList.fold(0.0, (previousValue, element) => previousValue + double.parse(element.price)).toString();
    });


  }

  void cartdelete(int id) {
    _addToCartController.deleteCart(id);
    setState(() {
      totalPrice = _addToCartController.productList.fold(0.0, (previousValue, element) => previousValue + double.parse(element.price)).toString();
    });

  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<AddToCartController>(
            builder: (addToCartController) {
              if (addToCartController.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (addToCartController.errorMessage != null) {
                return Center(
                  child: Text(addToCartController.errorMessage!),
                );
              }

              if (addToCartController.productList.isEmpty) {
                return const Center(
                  child: Text('Empty cart !'),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: addToCartController.productList.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          product: addToCartController.productList[index],
                          onDelete: cartdelete,

                        );
                      },
                    ),
                  ),
                  _buildPriceAndAddToCartSection()
                ],
              );
            }

        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price'),
    GetBuilder<AddToCartController>(
    builder: (addToCartController) {
      if (addToCartController.inProgress) {
        return const Center(
          child: Text(""),
        );
      }
    return   Text(
      '\$${addToCartController.productList.fold(0.0, (previousValue, element) => previousValue + double.parse(element.price)).toString()}',
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.themeColor),
    );
    }),

            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                  onPressed: _onTapCheckOutButton, child: const Text('Checkout')))
        ],
      ),
    );
  }
  void _onTapCheckOutButton() {
    Get.to(() => const PaymentDetailsScreen());
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
