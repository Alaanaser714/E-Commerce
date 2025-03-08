import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: AppStyles.f13w700(context),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: child,
        ),
      ],
    );
  }
}
