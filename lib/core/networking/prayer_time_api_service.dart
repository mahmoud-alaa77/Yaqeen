import 'package:dio/dio.dart';
import 'package:islamic_app/core/networking/api_constants.dart';
import 'package:islamic_app/features/prayer_time/data/models/prayer_time_model.dart';
import 'package:retrofit/retrofit.dart';

part 'prayer_time_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.prayerTimeBaseUrl)
abstract class PrayerTimeApiSevice {
  factory PrayerTimeApiSevice(Dio dio, {String baseUrl}) = _PrayerTimeApiSevice;

  @GET("/{cityName}.json?key=3394e73dfe709e091fcae797c08921b1")
  Future<PlayerTimeModel> getPrayerTime(@Path("cityName") String cityName);
}
