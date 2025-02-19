import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zuricycle/app/auth/auth.dart';

import '../../utils/utils.dart';
import '../main_pages/main_pages.dart';

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
            return const MainScreen();
          },
          routes: [
            GoRoute(
              name: RouteNames.CALENDAR_SCREEN,
              path: '/calendar-screen',
              builder: (BuildContext context, GoRouterState state) {
                return const CalendarScreen();
              },
            ),
            GoRoute(
              name: RouteNames.SETTINGS_SCREEN,
              path: '/settings-screen',
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
            ),
            GoRoute(
              name: RouteNames.PROFILE_SCREEN,
              path: '/profile-screen',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileScreen();
              },
            ),
          ],
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
