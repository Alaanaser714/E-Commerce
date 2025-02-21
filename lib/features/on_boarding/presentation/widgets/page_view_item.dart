import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.background,
      required this.image,
      required this.title,
      required this.subtitle});

  final String background, image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  fit: BoxFit.fill,
                  background,
                  color: Color(0xffB0E8C7),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Positioned(
                top: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "تخط",
                    style: AppStyles.f13w400(context)
                        .copyWith(color: Color(0xff949D9E)),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(title, style: AppStyles.f23w700(context)),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: AppStyles.f13w600(context)
                  .copyWith(color: Color(0xff949D9E))),
        ),
      ],
    );
  }
}
