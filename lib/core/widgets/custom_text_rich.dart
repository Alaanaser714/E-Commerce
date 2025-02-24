import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key, required this.text, required this.secondtext, this.onTap});

  final String text;
  final String secondtext;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text,
            style: AppStyles.f16w400(context).copyWith(color: Colors.grey)),
        TextSpan(
            text: secondtext,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: AppStyles.f16w400(context)
                .copyWith(color: AppColors.secondColor)),
      ]),
    );
  }
}
