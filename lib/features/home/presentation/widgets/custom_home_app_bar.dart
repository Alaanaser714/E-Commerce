import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_function.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(Assets.userImage),
      ),
      title: Text(
        "صباح الخير !..",
        style: AppStyles.f16w400(context).copyWith(color: Colors.grey),
      ),
      subtitle: Text(
        AppFunction().getUser().name,
        style: AppStyles.f16w700(context).copyWith(color: AppColors.blackColor),
      ),
      trailing: Container(
        width: 35,
        height: 35,
        child: SvgPicture.asset(
          Assets.notifaction,
        ),
        decoration: BoxDecoration(
          color: Color(0xffEEF8ED),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
