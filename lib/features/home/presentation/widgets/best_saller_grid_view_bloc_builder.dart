import 'package:e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/functions/get_dummy_products.dart';
import 'package:e_commerce/features/home/presentation/widgets/best_saller_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerGridViewBlocBuilder extends StatelessWidget {
  const BestSellerGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSallerGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              state.message,
              style: AppStyles.f19w700(context).copyWith(
                color: Colors.red,
              ),
            )),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSallerGridView(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
