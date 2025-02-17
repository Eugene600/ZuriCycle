import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zuricycle/app/auth/auth.dart';
import 'package:zuricycle/app/main_pages/home_screen.dart';

import '../../utils/utils.dart';

final routesProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier();
  return GoRouter(
    initialLocation: '/welcome-screen',
    refreshListenable: router, // Listens to changes and rebuilds when notified.
    routes: router.routes, // The actual route configuration.
  );
});

class RouterNotifier extends ChangeNotifier {
  List<GoRoute> get routes => [
        GoRoute(
          name: RouteNames.WELCOME_SCREEN,
          path: '/welcome-screen',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
          routes: authRoutes,
        ),
        GoRoute(
          name: RouteNames.HOME_SCREEN,
          path: '/home-screen',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
      ];

  List<GoRoute> authRoutes = [
    GoRoute(
      name: RouteNames.LOGIN_SCREEN,
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      name: RouteNames.REGISTRATION_SCREEN,
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegistrationScreen();
      },
    ),
  ];
}
