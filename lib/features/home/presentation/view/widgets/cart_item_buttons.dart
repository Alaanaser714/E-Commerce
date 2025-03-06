import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';

class CartItemButtons extends StatelessWidget {
  const CartItemButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            cartItemEntity.increasQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Text(cartItemEntity.quanitty.toString(),
            style: AppStyles.f19w700(context).copyWith(
              color: AppColors.blackColor,
            )),
        GestureDetector(
          onTap: () {
            cartItemEntity.decreasQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffF3F5F7),
            child: Icon(
              Icons.remove,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
