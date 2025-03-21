import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.pageController,
      this.onTap,
      this.height,
      this.width});

  final String text;
  final PageController? pageController;
  final void Function()? onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Center(
            child: Text(
              text,
              style: AppStyles.f16w700(context).copyWith(color: Colors.white),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
