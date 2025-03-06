import 'package:e_commerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/cart_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartItemCubit(),
        child: CartScreenBody(),
      ),
    );
  }
}
