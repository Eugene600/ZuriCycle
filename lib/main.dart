import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/navigation/navigation.dart';

void main() {
  runApp(const ProviderScope(child: ZuriCycle()));
}

class ZuriCycle extends StatelessWidget {
  const ZuriCycle({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final router = ref.watch(routesProvider);
      return MaterialApp.router(
        title: 'ZuriCycle',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFD48FB5), // Muted Rose (Soft and Elegant)
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(
                0xFFD48FB5),
            // seedColor: const Color(0xFF6A4C93),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      );
    });
  }
}

