import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'display/display.dart';
import 'utils/utils.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              0xFFD48FB5), // Same Muted Rose for dark mode consistency
          // seedColor: const Color(0xFF6A4C93),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ZuriCycle(),
    );
  }
}

class ZuriCycle extends StatelessWidget {
  const ZuriCycle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (BuildContext context, Color? bgColor) => Container(
          padding: const EdgeInsets.all(Constants.SPACING * 2),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Logo(size: 500),
              ),
              Text(
                "Welcome to ZuriCycle: Empower Your Wellness Journey,\nTrack, Predict, and Embrace Your Cycle.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onTertiaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Constants.SPACING + 10),
              const Text(
                "Let's you in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  //Will add later
                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: Constants.SPACING,
              ),
              const Text(
                "or",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: Constants.SPACING,
              ),
              OutlinedButton(
                onPressed: () {
                  //Will add later
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}