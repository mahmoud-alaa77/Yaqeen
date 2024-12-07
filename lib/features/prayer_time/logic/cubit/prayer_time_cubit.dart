import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/prayer_time/data/repo/prayer_time_repo.dart';

import '../../data/models/prayer_time_model.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final PrayerTimeRepo prayerTimeRepo;
  PrayerTimeCubit(this.prayerTimeRepo) : super(PrayerTimeInitial());

   getPrayerTime(String city) async {
    emit(PrayerTimeLoading());

    var result = await prayerTimeRepo.getPrayerTimeBycityNAmr(cityName: city);
    result.fold((failure) {
      emit(PrayerTimeFailure(error: failure.errorMessage));
    }, (prayerTime) {
      emit(PrayerTimeLoaded(prayerTime));
    });
  }


  
}
