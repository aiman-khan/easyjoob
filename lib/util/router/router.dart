import 'package:easyjoob/features/auth/presentation/views/login/login_view.dart';
import 'package:easyjoob/features/onboard/presentation/views/onboard/onboard_view.dart';

import '../../features/onboard/presentation/views/splash/splash_view.dart';
import '../di/di.dart';
import 'paths.dart';
import 'package:go_router/go_router.dart';
import 'middlewares.dart';

/// [Middlewares]
final _middleWares = sl<RouteMiddleWares>();

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: RoutePaths.onBoarding,
      redirect: (state, context) async {
        final routeName = await _middleWares.notFreshInstall(
            finalRoute: RoutePaths.onBoarding);
        return routeName;
      },
      builder: (context, state) {
        return const OnboardView();
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) {
        return const LoginView();
      },
    ),
  ],
);
