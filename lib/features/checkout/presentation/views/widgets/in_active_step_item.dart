import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});

  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            index,
            style: AppStyles.f13w600(context),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppStyles.f13w600(context).copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        )
      ],
    );
  }
}
