import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key, required this.text, required this.secondtext});

  final String text;
  final String secondtext;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text,
            style: AppStyles.f13w600(context).copyWith(color: Colors.grey)),
        TextSpan(
            text: secondtext,
            style: AppStyles.f13w600(context)
                .copyWith(color: AppColors.secondColor)),
      ]),
    );
  }
}
