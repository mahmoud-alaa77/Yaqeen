part of 'sebha_cubit.dart';

sealed class SebhaState {}

final class SebhaInitial extends SebhaState {}

final class AllTsbehListLoaded extends SebhaState {
  final List<SebhaItemModel> items;
  final int allCount;

  AllTsbehListLoaded({required this.allCount, required this.items});
}

final class TsbehListError extends SebhaState {
  final String error;

  TsbehListError({required this.error});
}

final class TsbehListLoading extends SebhaState {}
