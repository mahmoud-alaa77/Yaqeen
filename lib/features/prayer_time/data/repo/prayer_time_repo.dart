import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/core/errors/server_failure.dart';
import 'package:islamic_app/core/networking/prayer_time_api_service.dart';
import 'package:islamic_app/features/prayer_time/data/models/prayer_time_model.dart';

class PrayerTimeRepo {
  final PrayerTimeApiSevice prayerTimeApiService;

  PrayerTimeRepo(this.prayerTimeApiService);

  Future<Either<Failure, PlayerTimeModel>> getPrayerTimeBycityNAmr(
      {required String cityName}) async {
    try {
      var response = await prayerTimeApiService.getPrayerTime(cityName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
