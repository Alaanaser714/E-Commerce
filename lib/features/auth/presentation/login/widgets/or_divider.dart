import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "أو",
          style: AppStyles.f16w400(context),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
