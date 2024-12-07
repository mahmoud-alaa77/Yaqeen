import 'package:json_annotation/json_annotation.dart';

part 'prayer_time_model.g.dart';

@JsonSerializable()
class PlayerTimeModel {
  final String? title;
  final String? query;
  final String? playerTimeModelFor;
  final int? method;
  final String? prayerMethodName;
  final String? daylight;
  final String? timezone;
  final String? mapImage;
  final String? sealevel;
  final TodayWeather? todayWeather;
  final String? link;
  final String? qiblaDirection;
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? countryCode;
  final List<Item>? items;
  final int? statusValid;
  final int? statusCode;
  final String? statusDescription;

  PlayerTimeModel({
    required this.title,
    required this.query,
    required this.playerTimeModelFor,
    required this.method,
    required this.prayerMethodName,
    required this.daylight,
    required this.timezone,
    required this.mapImage,
    required this.sealevel,
    required this.todayWeather,
    required this.link,
    required this.qiblaDirection,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.countryCode,
    required this.items,
    required this.statusValid,
    required this.statusCode,
    required this.statusDescription,
  });

  factory PlayerTimeModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerTimeModelToJson(this);
}

@JsonSerializable()
class Item {
  final String? dateFor;
  final String? fajr;
  final String? shurooq;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;

  Item({
    required this.dateFor,
    required this.fajr,
    required this.shurooq,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class TodayWeather {
  final int? pressure;
  final String? temperature;

  TodayWeather({
    required this.pressure,
    required this.temperature,
  });

  factory TodayWeather.fromJson(Map<String, dynamic> json) =>
      _$TodayWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$TodayWeatherToJson(this);
}
