import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'custom_home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                child: CustomSearchTextField(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
