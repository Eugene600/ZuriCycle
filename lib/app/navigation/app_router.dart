import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zuricycle/app/auth/auth.dart';
import 'package:zuricycle/app/main_pages/pages/stats_screen.dart';
import 'package:zuricycle/features/logs/pages/logs_screen.dart';

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
  List<RouteBase> get routes => [
        GoRoute(
          name: RouteNames.WELCOME_SCREEN,
          path: '/welcome-screen',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
          routes: authRoutes,
        ),
        ShellRoute(
            builder: (context, state, child) {
              return MainScreen(child: child);
            },
            routes: [
              GoRoute(
                path: '/home-screen',
                name: RouteNames.HOME_SCREEN,
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                  path: '/calendar-screen',
                  name: RouteNames.CALENDAR_SCREEN,
                  builder: (context, state) => const CalendarScreen(),
                  routes: [
                    GoRoute(
                      path: '/logs-screen',
                      name: RouteNames.LOGS_SCREEN,
                      builder: (context, state) => const LogsScreen(),
                    ),
                  ]),
              GoRoute(
                path: '/stats-screen',
                name: RouteNames.STATS_SCREEN,
                builder: (context, state) => const StatScreen(),
              ),
              GoRoute(
                path: '/profile-screen',
                name: RouteNames.PROFILE_SCREEN,
                builder: (context, state) => const ProfileScreen(),
              ),
            ]),
      ];

  List<RouteBase> authRoutes = [
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

  List<RouteBase> calendarRoutes = [
    GoRoute(
      name: RouteNames.LOGS_SCREEN,
      path: '/logs-screen',
      builder: (BuildContext context, GoRouterState state) {
        return const LogsScreen();
      },
    ),
  ];
}
