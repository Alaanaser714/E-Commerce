import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductsScreenHeader extends StatelessWidget {
  const ProductsScreenHeader({super.key, required this.productsLength});

  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "  ($productsLength) نتائج ",
            style: AppStyles.f13w700(context),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.10000000149011612),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0x66CACECE)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: SvgPicture.asset(
              Assets.arrow,
            ),
          )
        ],
      ),
    );
  }
}
