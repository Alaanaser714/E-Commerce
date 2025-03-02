import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/home/presentation/widgets/best_seller_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/best_saller_grid_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/offer_products_item_list.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../core/utils/app_assets.dart';
import 'custom_home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomHomeAppBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomSearchTextField(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OfferProductsItemList(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: BestSellerRow(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            BestSallerGridView(),
          ],
        ),
      ),
    );
  }
}
