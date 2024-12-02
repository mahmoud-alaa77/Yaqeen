import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quraan/data/models/quran_model.dart';
import 'package:islamic_app/features/quraan/data/repo/quran_repo.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());

  final QuranRepo quranRepo;

  getSurahByNum(int num)async{
    
  }
}
