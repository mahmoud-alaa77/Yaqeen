import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/dark_mode_light_mode/app_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_mode_state.dart';

class AppThemeModeCubit extends Cubit<AppThemeModeState> {
  AppThemeModeCubit() : super(AppThemeModeInitial());

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void changeAppMode(ThemeState themeState) async {
    final sharedPreferences = await _getSharedPreferences();

    if (themeState == ThemeState.init) {
      final savedTheme = sharedPreferences.getString('theme');
      if (savedTheme == 'light') {
        emit(AppModeLight());
      } else {
        emit(AppModeDark());
      }
    } else {
      final themeString = themeState == ThemeState.dark ? 'dark' : 'light';
      await sharedPreferences.setString('theme', themeString);

      if (themeState == ThemeState.dark) {
        emit(AppModeDark());
      } else {
        emit(AppModeLight());
      }
    }
  }
}
