import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShappingSection extends StatefulWidget {
  const ShappingSection({super.key});

  @override
  State<ShappingSection> createState() => _ShappingSectionState();
}

class _ShappingSectionState extends State<ShappingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            context.read<OrderInputEntity>().payWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: (context
                      .read<OrderInputEntity>()
                      .cartEntity
                      .calculateTotalPrice() +
                  30)
              .toString(),
        ),
        SizedBox(
          height: 8,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
            context.read<OrderInputEntity>().payWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: "الدفع اونلاين",
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: context
              .read<OrderInputEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
