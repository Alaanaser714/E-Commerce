import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/auth/presentation/login/view/login_screen.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:e_commerce/features/splash/presentation/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/sign_up/view/sign_up_screen.dart';

abstract class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
    ],
  );
}
