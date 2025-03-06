import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Divider(
          thickness: .5,
          color: AppColors.secondColor,
          height: 20,
        ),
      ),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return CartItem(
          cartItemEntity: cartItems[index],
        );
      },
    );
  }
}
