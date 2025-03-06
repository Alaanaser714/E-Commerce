import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_screen_body.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "الشحن",
      ),
      body: CheckoutScreenBody(),
    );
  }
}
