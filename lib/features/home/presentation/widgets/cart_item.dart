import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(
              color: Color(0xffF3F5F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomNetworkImage(
                imageUrl:
                    "https://static.webteb.net/images/content/slideshow_slideshow_2325_7773b82ffc7-4a3a-4ad3-98dc-6de03c62bc37.jpg"),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("بطيخ",
                  style: AppStyles.f13w700(context).copyWith(
                    color: AppColors.blackColor,
                  )),
              SizedBox(
                height: 5,
              ),
              Text("3 كم",
                  style: AppStyles.f13w700(context).copyWith(
                    color: AppColors.orangeColor,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text("3",
                      style: AppStyles.f19w700(context).copyWith(
                        color: AppColors.blackColor,
                      )),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xffF3F5F7),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: AppColors.primaryColor,
                ),
              ),
              Text("60 جنيه ",
                  style: AppStyles.f16w700(context).copyWith(
                    color: AppColors.orangeColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
