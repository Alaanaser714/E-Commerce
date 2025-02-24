import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubits/signup_state.dart';
import 'package:e_commerce/features/auth/presentation/sign_up/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Builder(
        builder: (context) {
          return BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "تم انشاء الحساب بنجاح",
                      style: AppStyles.f16w400(context),
                    ),
                  ),
                );
                GoRouter.of(context).push(AppRoutes.login);
              } else if (state is SignupFailure) {
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
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignUpScreenBody());
            },
          );
        },
      ),
    );
  }
}
