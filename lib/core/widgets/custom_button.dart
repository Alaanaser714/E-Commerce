import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text});

  final String text ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 140),
        child: Text(
         text,
          style: AppStyles.f16w700(context).copyWith(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
