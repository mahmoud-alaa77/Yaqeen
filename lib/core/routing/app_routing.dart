import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/di/dependency_injection.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/features/azkaar/ui/azkaar_screen.dart';
import 'package:islamic_app/features/azkaar/ui/showing_azkar_screen.dart';
import 'package:islamic_app/features/home/ui/main_screen.dart';
import 'package:islamic_app/features/prayer_time/logic/cubit/prayer_time_cubit.dart';
import 'package:islamic_app/features/prayer_time/ui/prayer_time_screen.dart';
import 'package:islamic_app/features/quraan/data/models/surah_model.dart';
import 'package:islamic_app/features/quraan/logic/cubit/cubit/surah_cubit.dart';
import 'package:islamic_app/features/quraan/ui/quran_content_screen.dart';
import 'package:islamic_app/features/quraan/ui/surah_screen.dart';
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
      case Routes.quranContentScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SurahCubit(getIt()),
                  child: const QuranContentScreen(),
                ));
      case Routes.quranContentDetailScreen:
        final num = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SurahCubit>(),
                  child: SurahScreen(
                    number: num,
                  ),
                ));
      case Routes.prayerTimesScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<PrayerTimeCubit>()..getPrayerTime("cairo"),
                  child: const PrayerTimeScreen(),
                ));

      default:
        return null;
    }
  }
}
