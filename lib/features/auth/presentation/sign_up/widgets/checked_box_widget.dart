import 'package:e_commerce/core/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/app_colors.dart';

class CheckedBoxWidget extends StatefulWidget {
  const CheckedBoxWidget({super.key, required this.onChanged});
  final ValueChanged<bool>? onChanged;
  @override
  State<CheckedBoxWidget> createState() => _CheckedBoxWidgetState();
}

class _CheckedBoxWidgetState extends State<CheckedBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(10, 0),
          child: Checkbox(
            activeColor: AppColors.primaryColor,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
              widget.onChanged!(value!);
            },
          ),
        ),
        Expanded(
          child: CustomTextRich(
            text: "من خلال إنشاء حساب ، فإنك توافق على ",
            secondtext: "الشروط والأحكام الخاصة بنا",
          ),
        ),
      ],
    );
  }
}
