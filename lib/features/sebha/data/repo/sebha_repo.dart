import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/sebha/data/models/sebha_item_model.dart';

import '../../../../core/helpers/local_database_helper.dart';

class SebhaRepo {
  final DataBaseHelper dataBaseHelper;

  SebhaRepo(this.dataBaseHelper);

  Future<Either<Failure, List<SebhaItemModel>?>> getAllZekrList() async {
    try {
      var items = await dataBaseHelper.getAllSebhaList();
      return Right(items);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
