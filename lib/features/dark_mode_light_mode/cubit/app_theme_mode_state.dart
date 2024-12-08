part of 'app_theme_mode_cubit.dart';

sealed class AppThemeModeState {}

final class AppThemeModeInitial extends AppThemeModeState {}



final class AppModeLight extends AppThemeModeState {}

final class AppModeDark extends AppThemeModeState {}