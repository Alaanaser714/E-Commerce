import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 15,
      selectedItemColor: AppColors.primaryColor,
      unselectedFontSize: 15,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedItem,
      onTap: (index) {
        setState(() {
          selectedItem = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.homeIcon,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              selectedItem == 0 ? AppColors.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.productsIcon,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              selectedItem == 1 ? AppColors.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'المنتجات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.shoppingIcon,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              selectedItem == 2 ? AppColors.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'سلة التسوق',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.profileIcon,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              selectedItem == 3 ? AppColors.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'حسابي',
        ),
      ],
    );
  }
}
