part of 'surah_cubit.dart';

sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahLoadedSuccess extends SurahState {
  final SurahModel surahModel;

  SurahLoadedSuccess(this.surahModel);
}

final class SurahError extends SurahState {
  final String error;
  SurahError({required this.error});
}
