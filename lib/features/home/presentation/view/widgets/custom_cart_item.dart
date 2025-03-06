import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          onTap: () {},
        );
      },
    );
  }
}
