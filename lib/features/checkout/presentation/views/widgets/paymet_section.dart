import 'package:flutter/material.dart';

import 'order_summry_widget.dart';
import 'shipping_address_widget.dart';

class PaymetSection extends StatelessWidget {
  const PaymetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const OrderSummryWidget(),
          const SizedBox(
            height: 16,
          ),
          ShippingAddressWidget(),
        ],
      ),
    );
  }
}
