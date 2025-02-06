import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zuricycle/app/auth/auth.dart';

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
      ];


  List<GoRoute> authRoutes = [
    GoRoute(
          name: RouteNames.LOGIN_SCREEN,
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          },
        ),
  ];    
}
