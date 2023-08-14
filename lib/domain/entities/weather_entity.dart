import 'package:equatable/equatable.dart';

class WeatherListEntity extends Equatable {
  const WeatherListEntity(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list,
      required this.city});

  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherParametersEntity>? list;
  final CityEntity? city;

  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}

class WeatherParametersEntity extends Equatable {
  const WeatherParametersEntity(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.wind,
      required this.dt_txt});

  final int? dt;
  final MainEntity? main;
  final List<WeatherEntity>? weather;
  final WindEntity? wind;
  final String? dt_txt;

  @override
  List<Object?> get props => [dt, main, weather, wind, dt_txt];
}

class MainEntity extends Equatable {
  const MainEntity(
      {required this.temp,
      required this.temp_min,
      required this.temp_max,
      required this.humidity});

  final double? temp;
  final double? temp_min;
  final double? temp_max;
  final double? humidity;

  @override
  List<Object?> get props => [temp, temp_min, temp_max, humidity];
}

class WeatherEntity extends Equatable {
  const WeatherEntity(
      {required this.id,
      required this.main,
      required this.icon,
      required this.description});

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => [id, main, icon];
}

class WindEntity extends Equatable {
  const WindEntity({required this.speed, required this.deg});

  final double? speed;
  final int? deg;

  @override
  List<Object?> get props => [speed, deg];
}

class CityEntity extends Equatable {
  const CityEntity({required this.name, required this.country});

  final String? name;
  final String? country;

  @override
  List<Object?> get props => [name, country];
}
