import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'active_shipping_item_dot.dart';
import 'in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
  });

  final bool isSelected;
  final void Function()? onTap;

  final String title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.f13w600(context),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: AppStyles.f13w400(context)
                        .copyWith(color: Colors.black.withOpacity(.5)),
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: AppStyles.f13w600(context).copyWith(
                    color: AppColors.secondColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
