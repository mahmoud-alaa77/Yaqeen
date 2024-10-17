import 'package:flutter/material.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/features/home/ui/main_screen.dart';
import 'package:islamic_app/features/splash/splash_screen.dart';

class AppRouting {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      default:
        return null;
    }
  }
}
