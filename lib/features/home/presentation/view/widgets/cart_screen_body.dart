import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/cart_header.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'custom_cart_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80, top: 35), // مساحة للزر
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomAppBar(
                      title: "السلة",
                      leading: SizedBox(),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(child: CartHeader()),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  CartItemList(
                    cartItems: context.watch<CartCubit>().cartEntity.cartItems,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 20,
              child: CustomCartButton(),
            ),
          ],
        ),
      ),
    );
  }
}
