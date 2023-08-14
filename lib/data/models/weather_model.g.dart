// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiWeatherModel _$ApiWeatherModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiWeatherModel',
      json,
      ($checkedConvert) {
        final val = ApiWeatherModel(
          cod: $checkedConvert('cod', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as int?),
          cnt: $checkedConvert('cnt', (v) => v as int?),
          list: $checkedConvert(
              'list',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => WeatherParametersModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          city: $checkedConvert(
              'city',
              (v) => v == null
                  ? null
                  : CityModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiWeatherModelToJson(ApiWeatherModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

WeatherParametersModel _$WeatherParametersModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherParametersModel',
      json,
      ($checkedConvert) {
        final val = WeatherParametersModel(
          dt: $checkedConvert('dt', (v) => v as int?),
          main: $checkedConvert(
              'main',
              (v) => v == null
                  ? null
                  : MainModel.fromJson(v as Map<String, dynamic>)),
          weather: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          wind: $checkedConvert(
              'wind',
              (v) => v == null
                  ? null
                  : WindModel.fromJson(v as Map<String, dynamic>)),
          dt_txt: $checkedConvert('dt_txt', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$WeatherParametersModelToJson(
        WeatherParametersModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'dt_txt': instance.dt_txt,
    };

MainModel _$MainModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MainModel',
      json,
      ($checkedConvert) {
        final val = MainModel(
          temp: $checkedConvert('temp', (v) => (v as num?)?.toDouble()),
          temp_min: $checkedConvert('temp_min', (v) => (v as num?)?.toDouble()),
          temp_max: $checkedConvert('temp_max', (v) => (v as num?)?.toDouble()),
          humidity: $checkedConvert('humidity', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'humidity': instance.humidity,
    };

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherModel',
      json,
      ($checkedConvert) {
        final val = WeatherModel(
          id: $checkedConvert('id', (v) => v as int?),
          main: $checkedConvert('main', (v) => v as String?),
          icon: $checkedConvert('icon', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WindModel _$WindModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WindModel',
      json,
      ($checkedConvert) {
        final val = WindModel(
          speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
          deg: $checkedConvert('deg', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CityModel',
      json,
      ($checkedConvert) {
        final val = CityModel(
          name: $checkedConvert('name', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };
