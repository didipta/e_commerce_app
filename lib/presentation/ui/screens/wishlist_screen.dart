
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../../state_holders/wish_list_controller.dart';
import '../widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  final WishListController _wishListController =
  Get.find<WishListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.find<WishListController>().getWishList();
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
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body:  GetBuilder<WishListController>(
        builder: (wishListController) {
          if (wishListController.inProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (wishListController.errorMessage != null) {
            return Center(
              child: Text(wishListController.errorMessage!),
            );
          }
          if (wishListController.wishList.isEmpty) {
            return const Center(
              child: Text('Empty wishlist !'),
            );
          }
          return GridView.builder(
          itemCount: _wishListController.wishList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            ),
           itemBuilder: (context, index) {
            return  FittedBox(
              child: ProductCard(
                product: ProductModel(
                  id: _wishListController.wishList[index].product.id,
                  title: _wishListController.wishList[index].product.title,
                  price: _wishListController.wishList[index].product.price,
                  image: _wishListController.wishList[index].product.image,
                  star: _wishListController.wishList[index].product.star,
                ),
                isWishList: true,
              ),
            );
         },
          );
        },
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
