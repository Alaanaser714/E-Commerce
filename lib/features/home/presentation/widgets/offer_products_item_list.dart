import 'package:e_commerce/features/home/presentation/widgets/offer_products_item.dart';
import 'package:flutter/material.dart';

class OfferProductsItemList extends StatelessWidget {
  const OfferProductsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: OfferProductsItem(),
          );
        }),
      ),
    );
  }
}
