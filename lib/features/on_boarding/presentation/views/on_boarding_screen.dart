import 'package:e_commerce/core/widgets/custom_button.dart';

import 'package:e_commerce/features/on_boarding/presentation/widgets/dots_indcators.dart';
import 'package:e_commerce/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnBoardingPageView()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return DotsIndcators(
                isActive: false,
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(text: 'ابدأ الان'),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
        ],
      ),
    );
  }
}
