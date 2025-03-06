import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffEBF9F1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          "لديك 3 منتجات في سله التسوق",
          textAlign: TextAlign.center,
          style: AppStyles.f13w400(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
