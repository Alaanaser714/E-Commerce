import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/login/widgets/custom_socail_widgets.dart';
import 'package:e_commerce/features/auth/presentation/login/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_rich.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'البريد الإلكتروني',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      password = value;
                    },
                    hintText: "كلمة المرور",
                    isPassword: true),
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
                CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        context.read<LoginCubit>().loginWithEmailAndPassword(
                              email!,
                              password!,
                            );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: "تسجيل دخول"),
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
                  onTap: () {
                    context.read<LoginCubit>().loginWithGoogle();
                  },
                  image: Assets.Google,
                  text: 'تسجيل بواسطة جوجل',
                ),
                CustomSocailWidgets(
                  image: Assets.Apple,
                  text: "تسجيل بواسطة أبل",
                  onTap: () {},
                ),
                CustomSocailWidgets(
                  image: Assets.Face,
                  text: "تسجيل بواسطة فيسبوك",
                  onTap: () {
                    context.read<LoginCubit>().loginWithfacebook();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
