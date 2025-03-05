import 'package:e_commerce/features/home/presentation/view/products_screen.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_screen.dart';
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

  final List<Widget> pages = [
    HomeScreen(),
    ProductsScreen(),
    SizedBox(
      child: Text("data2"),
    ),
    SizedBox(
      child: Text("data3"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedItem,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              icon: _buildIcon(Assets.homeIcon, 0), label: 'الرئيسية'),
          BottomNavigationBarItem(
              icon: _buildIcon(Assets.productsIcon, 1), label: 'المنتجات'),
          BottomNavigationBarItem(
              icon: _buildIcon(Assets.shoppingIcon, 2), label: 'سلة التسوق'),
          BottomNavigationBarItem(
              icon: _buildIcon(Assets.profileIcon, 3), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _buildIcon(String asset, int index) {
    return SvgPicture.asset(
      asset,
      height: 20,
      width: 20,
      colorFilter: ColorFilter.mode(
        selectedItem == index ? AppColors.primaryColor : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
