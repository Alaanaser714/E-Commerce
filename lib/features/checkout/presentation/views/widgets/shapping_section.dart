import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShappingSection extends StatefulWidget {
  const ShappingSection({super.key});

  @override
  State<ShappingSection> createState() => _ShappingSectionState();
}

class _ShappingSectionState extends State<ShappingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '50',
        ),
        SizedBox(
          height: 8,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'اشتري الان وادفع لاحقا',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: '20',
        )
      ],
    );
  }
}
