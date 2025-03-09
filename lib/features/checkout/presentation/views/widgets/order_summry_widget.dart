import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppStyles.f13w400(context).copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()}جنيه',
                textAlign: TextAlign.right,
                style: AppStyles.f16w400(context),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: AppStyles.f13w400(context).copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 30}جنية',
                textAlign: TextAlign.right,
                style: AppStyles.f13w400(context).copyWith(
                  color: const Color(0xFF4E5556),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text(
                'الكلي',
                style: AppStyles.f16w700(context),
              ),
              const Spacer(),
              Text(
                '30 جنيه',
                style: AppStyles.f16w700(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
