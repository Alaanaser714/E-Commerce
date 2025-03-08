import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_screen_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartEntity});

  final CartEntity cartEntity;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "الشحن",
      ),
      body: Provider.value(
        value: OrderInputEntity(cartEntity: cartEntity),
        child: CheckoutScreenBody(),
      ),
    );
  }
}
