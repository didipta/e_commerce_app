
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../state_holders/wish_list_controller.dart';
import '../screens/product_details_screen.dart';
import '../utils/app_colors.dart';
import '../utils/snack_message.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product, required this.isWishList,


  });

  final ProductModel product;
  final bool isWishList;


  @override
  Widget build(BuildContext context) {
    final WishListController _wishListController =
    Get.find<WishListController>();
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: product.id!));
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(product.image ?? ''),
                      fit: BoxFit.scaleDown),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.themeColor),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            Text(
                              '${product.star}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Card(

                          color: isWishList ?Colors.red: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: InkWell(
                            onTap: () async {
                              if (isWishList) {
                                _wishListController.deleteWishList(product.id!);
                              } else {
                               bool result= await _wishListController.Createlist(product.id!);
                                if(result){


                                  showSnackBarMessage(
                                      context,'Added to wish list', true);

                                }
                                else{
                                  showSnackBarMessage(
                                      context,_wishListController.errorMessage!, false);
                                }

                              }

                            },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  isWishList ? Icons.delete_outline : Icons.favorite_border,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
