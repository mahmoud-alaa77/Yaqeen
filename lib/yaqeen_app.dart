import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/routing/app_routing.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/core/theming/app_theme.dart';
import 'package:islamic_app/features/dark_mode_light_mode/app_theme_state.dart';
import 'package:islamic_app/features/dark_mode_light_mode/cubit/app_theme_mode_cubit.dart';
import 'package:islamic_app/features/splash/splash_screen.dart';

class YaqeenApp extends StatelessWidget {
  final AppRouting appRouter;
  const YaqeenApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeModeCubit()..changeAppMode(ThemeState.init),
      child: BlocBuilder<AppThemeModeCubit, AppThemeModeState>(
        builder: (context, state) {
          if(state is AppModeDark){
            return ScreenUtilInit(
            designSize: const Size(392, 872),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Yaqeen',
              theme: AppTheme.darkMode,
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
          }else if(state is AppModeLight){
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
          }else{
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
        },
      ),
    );
  }
}
