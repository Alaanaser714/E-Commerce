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
    return PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return SizedBox();
        });
  }
}
