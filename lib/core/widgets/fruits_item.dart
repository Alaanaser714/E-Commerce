import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:e_commerce/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({super.key, required this.addProductsEntity});

  final AddProductsEntity addProductsEntity;

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
                    addProductsEntity.imageUrl != null
                        ? Flexible(
                            child: CustomNetworkImage(
                                imageUrl: addProductsEntity.imageUrl!))
                        : Container(
                            color: Colors.grey,
                            height: 100,
                            width: 100,
                          ),
                    SizedBox(height: 15),
                    ListTile(
                      title: Text(
                        addProductsEntity.name,
                        style: AppStyles.f16w400(context)
                            .copyWith(color: AppColors.blackColor),
                      ),
                      subtitle: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "${addProductsEntity.price}جنية",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.orangeColor),
                          ),
                          TextSpan(
                            text: "/ ",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.orangeColor),
                          ),
                          TextSpan(
                            text: " كيلو",
                            style: AppStyles.f13w700(context)
                                .copyWith(color: AppColors.secondOrangeColor),
                          ),
                        ]),
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
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
