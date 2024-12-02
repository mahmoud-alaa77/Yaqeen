import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/core/errors/server_failure.dart';
import 'package:islamic_app/core/networking/api_services.dart';
import 'package:islamic_app/features/quraan/data/models/quran_model.dart';
import 'package:islamic_app/features/quraan/data/models/surah_model.dart';

class QuranRepo {
  final ApiServices apiServices;

  QuranRepo(this.apiServices);

  Future<Either<Failure, QuranModel>> getAllQuran() async {
    try {
      var response = await apiServices.getAllQuran();

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, SurahModel>> getSurahByNum({required String num}) async {
    try {
      var response = await apiServices.getSurahByNum(num);

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
