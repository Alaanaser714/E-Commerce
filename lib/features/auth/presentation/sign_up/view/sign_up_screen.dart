import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/checked_box_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "حساب جديد"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                keyboardType: TextInputType.name,
                hintText: "الاسم كامل",
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(hintText: "كلمة المرور", isPassword: true),
              SizedBox(
                height: 10,
              ),
              CheckedBoxWidget(),
              SizedBox(
                height: 30,
              ),
              CustomButton(text: "إنشاء حساب جديد"),
              SizedBox(
                height: 30,
              ),
              CustomTextRich(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.login);
                  },
                  text: " تمتلك حساب بالفعل؟",
                  secondtext: "  تسجيل دخول")
            ],
          ),
        ),
      ),
    );
  }
}
