import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          CustomTextFormField(hintText: "الاسم كامل"),
          CustomTextFormField(hintText: "البريد الإلكتروني"),
          CustomTextFormField(hintText: "رقم الهاتف"),
          CustomTextFormField(hintText: "العنوان"),
          CustomTextFormField(hintText: "المدينه"),
          CustomTextFormField(hintText: "رقم الطابق , رقم الشقه .."),
        ],
      ),
    );
  }
}
