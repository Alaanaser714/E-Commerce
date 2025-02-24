import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubits/signup_state.dart';
import 'package:e_commerce/features/auth/presentation/sign_up/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              
            },
            builder: (context, state) {
              return SignUpScreenBody();
            },
          );
        },
      ),
    );
  }
}
