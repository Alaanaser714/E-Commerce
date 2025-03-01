import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF3F5F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      height: 130,
                      width: 100,
                      Assets.offerproductsImage,
                    ),
                    ListTile(
                      title: Text(
                        "بطيخ",
                        style: AppStyles.f16w400(context)
                            .copyWith(color: AppColors.blackColor),
                      ),
                      subtitle: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "20جنية",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.orangeColor),
                          ),
                          TextSpan(
                            text: "/ ",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.orangeColor),
                          ),
                          TextSpan(
                            text: " الكيلو",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.secondOrangeColor),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
