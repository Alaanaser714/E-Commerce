import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_rich.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'checked_box_widget.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "حساب جديد"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextFormField(
                  onSaved: (value) {
                    name = value;
                  },
                  keyboardType: TextInputType.name,
                  hintText: "الاسم كامل",
                ),
                SizedBox(
                  height: 16,
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
                  height: 10,
                ),
                CheckedBoxWidget(),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                                email!, password!, name!);
                        GoRouter.of(context).push(AppRoutes.login);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: "إنشاء حساب جديد"),
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
      ),
    );
  }
}
