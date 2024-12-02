import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quraan/data/models/surah_model.dart';
import 'package:islamic_app/features/quraan/data/repo/quran_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final QuranRepo quranRepo;
  SurahCubit(this.quranRepo) : super(SurahInitial());

  getSurahByNum(String num) async {
    emit(SurahLoading());

    var result = await quranRepo.getSurahByNum(num: num);
    result.fold((failure) {
      emit(SurahError(error: failure.errorMessage));
    }, (surahModel) {
      emit(SurahLoadedSuccess(surahModel));
    });
  }
}
