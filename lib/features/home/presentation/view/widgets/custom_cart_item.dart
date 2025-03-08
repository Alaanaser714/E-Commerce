import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartItemCubit, CartItemState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomButton(
          height: 60,
          text:
              "الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
          onTap: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              GoRouter.of(context).push(AppRoutes.checkout,
                  extra: context.read<CartCubit>().cartEntity);
            } else if (context.read<CartCubit>().cartEntity.cartItems.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "لا يوجد منتجات في سلة التسوق",
                  style: AppStyles.f19w700(context).copyWith(),
                ),
              ));
            }
          },
        );
      },
    );
  }
}
