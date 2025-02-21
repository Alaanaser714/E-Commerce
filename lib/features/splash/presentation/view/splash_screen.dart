import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/services/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isOnBoardingViewed = SharedPref.getBool("kIsOnBoardingViewSeen");
    Future.delayed(Duration(seconds: 5), () {
      if (isOnBoardingViewed == true) {
        GoRouter.of(context).push(AppRoutes.login);
      } else {
        GoRouter.of(context).push(AppRoutes.onBoarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(Assets.Splash1),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          Center(child: SvgPicture.asset(Assets.Splash2)),
          Spacer(),
          SvgPicture.asset(Assets.SplashBottom),
        ],
      ),
    );
  }
}
