import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/fruits_item.dart';

class BestSallerGridView extends StatelessWidget {
  const BestSallerGridView({super.key, required this.products});

  final List<AddProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FruitsItem(
              addProductsEntity: products[index],
            ),
          );
        });
  }
}
