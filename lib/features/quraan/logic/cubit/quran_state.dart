part of 'quran_cubit.dart';

sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

final class QuranLoaded extends QuranState {
  final QuranModel quranModel;

  QuranLoaded(this.quranModel);
}

final class QuranError extends QuranState {
  final String error;
  QuranError({required this.error});
}
