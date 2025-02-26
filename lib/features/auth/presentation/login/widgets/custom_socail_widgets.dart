import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocailWidgets extends StatelessWidget {
  const CustomSocailWidgets(
      {super.key, required this.image, required this.text, required this.onTap});

  final String image;
  final String text;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap:onTap ,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SvgPicture.asset(image),
                SizedBox(
                  width: 25,
                ),
                Text(
                  text,
                  style: AppStyles.f16w700(context),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xffDDDFDF), width: 1)),
        ),
      ),
    );
  }
}
