import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/helpers/constants.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/features/sign_up.dart/ui/sign_up_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Theme.of(context).brightness == Brightness.light
            ? Image.asset(lightSplashImage)
            : Image.asset(darkSplashImage),
        splashIconSize: 500,
        duration: 600,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        animationDuration: const Duration(milliseconds: 1500),
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: const SignUpScreen(),
        nextRoute: Routes.sigiUpScreen,
      ),
    );
  }
}
