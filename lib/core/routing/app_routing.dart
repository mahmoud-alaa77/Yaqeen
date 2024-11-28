import 'package:flutter/material.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/features/azkaar/ui/azkaar_screen.dart';
import 'package:islamic_app/features/azkaar/ui/showing_azkar_screen.dart';
import 'package:islamic_app/features/home/ui/main_screen.dart';
import 'package:islamic_app/features/splash/splash_screen.dart';

class AppRouting {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case Routes.azkaarScreen:
        return MaterialPageRoute(builder: (context) => const AzkaarScreen());
      case Routes.allZakrScreen:
        final azkaar = settings.arguments as List<Map<String, String>>;
        return MaterialPageRoute(
            builder: (context) => ShowingAzkarScreen(
                  azkaar: azkaar,
                ));

      default:
        return null;
    }
  }
}
