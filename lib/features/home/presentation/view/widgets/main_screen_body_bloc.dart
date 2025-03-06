import 'package:e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import 'custom_bottom_navigation_bar.dart';

class MainScreenBodyBLoc extends StatelessWidget {
  const MainScreenBodyBLoc({
    super.key,
    required this.selectedItem,
    required this.pages,
  });

  final int selectedItem;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              'تم اضافة المنتج',
              style: AppStyles.f19w700(context).copyWith(
                color: Colors.green,
              ),
            )),
          );
        } else if (state is CartItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('تم حذف المنتج',
                  style: AppStyles.f19w700(context).copyWith(
                    color: Colors.red,
                  ))));
        }
      },
      child: MainScreenBody(selectedItem: selectedItem, pages: pages),
    );
  }
}
