import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndcators extends StatelessWidget {
  const DotsIndcators({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 11,
      width: isActive ? 20 : 11,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : Color(0xff5DB957),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          )),
      duration: Duration(milliseconds: 300),
    );
  }
}
