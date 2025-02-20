import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/splash/presentation/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );
}
