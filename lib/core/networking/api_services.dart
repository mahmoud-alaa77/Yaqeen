import 'package:dio/dio.dart';
import 'package:islamic_app/core/networking/api_constants.dart';
import 'package:islamic_app/features/quraan/data/models/quran_model.dart';
import 'package:islamic_app/features/quraan/data/models/surah_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.quranBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET("quran/en.asad")
  Future<QuranModel> getAllQuran();

  @GET("surah/{num}/ar.asad")
  Future<SurahModel> getSurahByNum(@Path("num") String num);
}
