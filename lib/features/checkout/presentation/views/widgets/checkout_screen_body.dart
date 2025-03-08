import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';

import 'checkout_page_view.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CheckoutSteps(
              currentPageIndex: currentPageIndex,
              pageController: pageController,
              onTap: (index) {}),
          Expanded(
            child: ChekoutPageView(pageController: pageController),
          ),
          CustomButton(
              text: getNextButtonText(currentPageIndex),
              onTap: () {
                pageController.animateToPage(currentPageIndex + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .1,
          )
        ],
      ),
    );
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }
}
