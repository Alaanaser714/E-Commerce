import 'package:e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/view/cart_screen.dart';
import 'package:e_commerce/features/home/presentation/view/products_screen.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/home_screen.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/main_screen_body_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

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
    CartScreen(),
    SizedBox(
      child: Text("data3"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: MainScreenBodyBLoc(selectedItem: selectedItem, pages: pages),
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

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    super.key,
    required this.selectedItem,
    required this.pages,
  });

  final int selectedItem;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedItem,
      children: pages,
    );
  }
}
