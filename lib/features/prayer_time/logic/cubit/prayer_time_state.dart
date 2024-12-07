part of 'prayer_time_cubit.dart';

sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeLoading extends PrayerTimeState {}

final class PrayerTimeLoaded extends PrayerTimeState {
  final PlayerTimeModel prayerTime;

  PrayerTimeLoaded(this.prayerTime);
}

final class PrayerTimeFailure extends PrayerTimeState {
  final String error;
  PrayerTimeFailure({required this.error});
}
