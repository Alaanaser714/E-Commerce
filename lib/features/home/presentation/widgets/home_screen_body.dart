import 'package:flutter/material.dart';

import 'custom_home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomHomeAppBar(),
            )
          ],
        ),
      ),
    );
  }
}
