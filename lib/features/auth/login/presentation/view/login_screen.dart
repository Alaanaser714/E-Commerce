import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/custom_text_rich.dart';
import 'package:e_commerce/features/auth/login/presentation/widgets/custom_socail_widgets.dart';
import 'package:e_commerce/features/auth/login/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "تسجيل دخول",
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
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
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: AppStyles.f13w600(context).copyWith(
                          color: AppColors.secondColor,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(text: "تسجيل دخول"),
              SizedBox(
                height: 33,
              ),
              CustomTextRich(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.signUp);
                  },
                  text: " قم بانشاء حساب؟",
                  secondtext: " لا تمتلك حساب؟"),
              SizedBox(
                height: 33,
              ),
              OrDivider(),
              SizedBox(
                height: 21,
              ),
              CustomSocailWidgets(
                image: Assets.Google,
                text: 'تسجيل بواسطة جوجل',
              ),
              CustomSocailWidgets(
                image: Assets.Apple,
                text: "تسجيل بواسطة أبل",
              ),
              CustomSocailWidgets(
                image: Assets.Face,
                text: "تسجيل بواسطة فيسبوك",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
