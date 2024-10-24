
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../../data/models/Cart_model.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class CartItemWidget extends StatelessWidget {
  final Cartproduct product;
  final Function? onDelete;
  const CartItemWidget({
    super.key, required this.product, this.onDelete,
  });

  @override


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _buildProductImage(
            product.product.image

          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.product.title ??
                            '',
                            style: textTheme.bodyLarge,
                          ),
                          _buildColorAndSize(textTheme, product.size, product.color),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onDelete!(
                            product.productId!
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                _buildPriceAndCounter(textTheme, product.product.price),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildColorAndSize(TextTheme textTheme,String size, String color) {
    return Wrap(
      spacing: 8,
      children: [
        Text(
          'Color: $color',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        Text(
          'Size: $size',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndCounter(TextTheme textTheme,String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$$price',
          style: textTheme.titleMedium?.copyWith(color: AppColors.themeColor),
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {

          },
        ),
      ],
    );
  }

  Widget _buildProductImage(image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        image ?? '',
        height: 80,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
