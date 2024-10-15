import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/routing/app_routing.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/core/theming/app_theme.dart';
import 'package:islamic_app/features/splash/splash_screen.dart';

class YaqeenApp extends StatelessWidget {
  final AppRouting appRouter;
  const YaqeenApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 872),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yaqeen',
        theme: AppTheme.lightMode,
        //darkTheme: AppTheme.darkMode,
        //themeMode: ThemeMode.system,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.genrateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
