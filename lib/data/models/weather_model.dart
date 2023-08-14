import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class ApiWeatherModel {
  const ApiWeatherModel(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list,
      required this.city});

  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherParametersModel>? list;
  final CityModel? city;

  factory ApiWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$ApiWeatherModelFromJson(json);
}

@JsonSerializable()
class WeatherParametersModel {
  const WeatherParametersModel(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.wind,
      required this.dt_txt});

  final int? dt;
  final MainModel? main;
  final List<WeatherModel>? weather;
  final WindModel? wind;
  final String? dt_txt;

  factory WeatherParametersModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherParametersModelFromJson(json);
}

@JsonSerializable()
class MainModel {
  const MainModel(
      {required this.temp,
      required this.temp_min,
      required this.temp_max,
      required this.humidity});

  final double? temp;
  final double? temp_min;
  final double? temp_max;
  final double? humidity;

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}

@JsonSerializable()
class WeatherModel {
  const WeatherModel(
      {required this.id,
      required this.main,
      required this.icon,
      required this.description});

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class WindModel {
  const WindModel({required this.speed, required this.deg});

  final double? speed;
  final int? deg;

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  const CityModel({required this.name, required this.country});

  final String? name;
  final String? country;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
