import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import 'payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          Image.asset(Assets.locationIcon),
          const SizedBox(
            width: 8,
          ),
          Text(
            ' شارع القاهرة، مصر',
            textAlign: TextAlign.right,
            style: AppStyles.f13w400(context).copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              child: Row(
                children: [
                  Image.asset(Assets.editIcon),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: AppStyles.f13w600(context).copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
