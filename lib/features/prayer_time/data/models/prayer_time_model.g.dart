// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerTimeModel _$PlayerTimeModelFromJson(Map<String, dynamic> json) =>
    PlayerTimeModel(
      title: json['title'] as String?,
      query: json['query'] as String?,
      playerTimeModelFor: json['playerTimeModelFor'] as String?,
      method: (json['method'] as num?)?.toInt(),
      prayerMethodName: json['prayerMethodName'] as String?,
      daylight: json['daylight'] as String?,
      timezone: json['timezone'] as String?,
      mapImage: json['mapImage'] as String?,
      sealevel: json['sealevel'] as String?,
      todayWeather: json['todayWeather'] == null
          ? null
          : TodayWeather.fromJson(json['todayWeather'] as Map<String, dynamic>),
      link: json['link'] as String?,
      qiblaDirection: json['qiblaDirection'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusValid: (json['statusValid'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusDescription: json['statusDescription'] as String?,
    );

Map<String, dynamic> _$PlayerTimeModelToJson(PlayerTimeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'query': instance.query,
      'playerTimeModelFor': instance.playerTimeModelFor,
      'method': instance.method,
      'prayerMethodName': instance.prayerMethodName,
      'daylight': instance.daylight,
      'timezone': instance.timezone,
      'mapImage': instance.mapImage,
      'sealevel': instance.sealevel,
      'todayWeather': instance.todayWeather,
      'link': instance.link,
      'qiblaDirection': instance.qiblaDirection,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'items': instance.items,
      'statusValid': instance.statusValid,
      'statusCode': instance.statusCode,
      'statusDescription': instance.statusDescription,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      dateFor: json['dateFor'] as String?,
      fajr: json['fajr'] as String?,
      shurooq: json['shurooq'] as String?,
      dhuhr: json['dhuhr'] as String?,
      asr: json['asr'] as String?,
      maghrib: json['maghrib'] as String?,
      isha: json['isha'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'dateFor': instance.dateFor,
      'fajr': instance.fajr,
      'shurooq': instance.shurooq,
      'dhuhr': instance.dhuhr,
      'asr': instance.asr,
      'maghrib': instance.maghrib,
      'isha': instance.isha,
    };

TodayWeather _$TodayWeatherFromJson(Map<String, dynamic> json) => TodayWeather(
      pressure: (json['pressure'] as num?)?.toInt(),
      temperature: json['temperature'] as String?,
    );

Map<String, dynamic> _$TodayWeatherToJson(TodayWeather instance) =>
    <String, dynamic>{
      'pressure': instance.pressure,
      'temperature': instance.temperature,
    };
