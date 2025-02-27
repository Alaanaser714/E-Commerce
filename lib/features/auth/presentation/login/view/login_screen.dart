import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/utils/app_styles.dart';

import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/routes/app_routes.dart';
import '../widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Builder(builder: (context) {
        return BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "تم تسجيل الدخول بنجاح",
                    style: AppStyles.f16w400(context),
                  ),
                ),
              );
              GoRouter.of(context).pushReplacement(AppRoutes.home);
            } else {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      state.message,
                      style: AppStyles.f16w400(context),
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is LoginLoading ? true : false,
                child: LoginScreenBody());
          },
        );
      }),
    );
  }
}
