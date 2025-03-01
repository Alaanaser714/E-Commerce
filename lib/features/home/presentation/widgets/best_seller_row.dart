import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class BestSellerRow extends StatelessWidget {
  const BestSellerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الأكثر مبيعًا",
            style: AppStyles.f13w700(context),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "المزيد",
              style: AppStyles.f13w400(context).copyWith(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
