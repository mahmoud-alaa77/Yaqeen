import 'package:json_annotation/json_annotation.dart';

part 'quran_model.g.dart';
  @JsonSerializable()

class QuranModel {
  int? code;
  String? status;
  Data? data;

  QuranModel({this.code, this.status, this.data});

  factory QuranModel.fromJson(Map<String, dynamic> json) =>
      _$QuranModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranModelToJson(this);
}

@JsonSerializable()
class Data {
  List<Surahs>? surahs;

  Data({
    this.surahs,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Surahs {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Surahs(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.ayahs});
  factory Surahs.fromJson(Map<String, dynamic> json) => _$SurahsFromJson(json);

  Map<String, dynamic> toJson() => _$SurahsToJson(this);
}

@JsonSerializable()
class Ayahs {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});


factory Ayahs.fromJson(Map<String, dynamic> json) => _$AyahsFromJson(json);

  Map<String, dynamic> toJson() => _$AyahsToJson(this);

}
