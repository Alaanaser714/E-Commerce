import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
