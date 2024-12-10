import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/sebha/data/models/sebha_item_model.dart';
import 'package:islamic_app/features/sebha/data/repo/sebha_repo.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  final SebhaRepo repo;
  SebhaCubit(this.repo) : super(SebhaInitial());

  TextEditingController? zekrController = TextEditingController();
  List<SebhaItemModel>? azkaar = [];
  getAllZekrList() async {
    emit(TsbehListLoading());

    var result = await repo.getAllZekrList();

    result.fold((failure) {
      emit(TsbehListError(error: failure.errorMessage));
    }, (items) {
      azkaar = items;
      int all=0;
      for (var i = 0; i < azkaar!.length ; i++) {
        all = all + azkaar![i].count;
      }
      emit(AllTsbehListLoaded(items: items ?? [], allCount: all ));
    });
  }
}
