import 'package:e_commerce/core/services/shared_pref.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';

import 'package:e_commerce/features/on_boarding/presentation/widgets/dots_indcators.dart';
import 'package:e_commerce/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/routes/app_routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

late PageController pageController;
int currentPage = 0;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    pageController = PageController();
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: OnBoardingPageView(
            pageController: pageController,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return DotsIndcators(
                isActive: currentPage == index,
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          currentPage == 0
              ? GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: CustomButton(
                    text: 'التالي',
                    pageController: pageController,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    SharedPref.setBool(kisOnboardingscreenSeen, true);
                    GoRouter.of(context).pushReplacement(AppRoutes.login);
                  },
                  child: CustomButton(
                    text: 'ابدأ الان',
                    pageController: pageController,
                  ),
                ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
