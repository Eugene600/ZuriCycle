import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../display/display.dart';
import '../../../utils/utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              // const Center(
              //   child: Logo(size: 500),
              // ),
              Text(
                "ZuriCycle".toUpperCase(),
                style: TextStyle(
                  fontSize: theme.textTheme.displayLarge
                      ?.fontSize, 
                color: theme.colorScheme.primary      
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Welcome to ZuriCycle:\n Empower Your Wellness Journey,\nTrack, Predict, and Embrace Your Cycle.",
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
                  context.goNamed(RouteNames.LOGIN_SCREEN);
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
                  context.goNamed(RouteNames.REGISTRATION_SCREEN);
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
