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
      builder: (context, state) {
        return const OnboardView();
      },
    ),
  ],
);
