
import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';
import '../product_card.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
    required this.productList
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: productList[index],
          isWishList: false,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}
