import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_app/core/networking/api_services.dart';
import 'package:islamic_app/core/networking/prayer_time_api_service.dart';
import 'package:islamic_app/features/prayer_time/data/repo/prayer_time_repo.dart';
import 'package:islamic_app/features/prayer_time/logic/cubit/prayer_time_cubit.dart';
import 'package:islamic_app/features/quraan/data/repo/quran_repo.dart';
import 'package:islamic_app/features/quraan/logic/cubit/cubit/surah_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//Api Service

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetUpDio()),
  );

  getIt.registerLazySingleton<PrayerTimeApiSevice>(
    () => PrayerTimeApiSevice(createAndSetUpDio()),
  );

//surah of quran
  getIt.registerLazySingleton<QuranRepo>(() => QuranRepo(getIt()));

  getIt.registerFactory<SurahCubit>(() => SurahCubit(getIt()));

  //prayerTime
  getIt.registerLazySingleton<PrayerTimeRepo>(() => PrayerTimeRepo(getIt()));

  getIt.registerFactory<PrayerTimeCubit>(() => PrayerTimeCubit(getIt()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    request: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
