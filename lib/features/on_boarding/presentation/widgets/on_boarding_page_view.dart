import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        PageViewItem(
          background: Assets.OnboardingbackGround,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.Onboarding1,
          title: 'مرحبًا بك في FruitHUB',
          isShow: true,
        ),
        PageViewItem(
          background: Assets.Onboarding22,
          subtitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          image: Assets.Onboarding2,
          title: 'ابحث وتسوق',
          isShow: false,
        ),
      ],
    );
  }
}
