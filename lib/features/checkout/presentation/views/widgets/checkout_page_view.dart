import 'package:e_commerce/features/checkout/presentation/views/widgets/shapping_section.dart';
import 'package:flutter/material.dart';

import 'checkout_steps.dart';

class ChekoutPageView extends StatelessWidget {
  const ChekoutPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: getSteps().length,
          itemBuilder: (context, index) {
            return getPages()[index];
          }),
    );
  }

  List<Widget> getPages() {
    return [
      ShappingSection(),
      SizedBox(),
      SizedBox(),
    ];
  }
}
