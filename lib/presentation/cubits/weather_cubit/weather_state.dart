part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;

  bool get isLoading => this == WeatherStatus.loading;

  bool get isSuccess => this == WeatherStatus.success;

  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  const WeatherState({this.status = WeatherStatus.initial, this.weatherList});

  final WeatherStatus status;
  final WeatherListEntity? weatherList;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherListEntity? weatherList,
  }) {
    return WeatherState(
        status: status ?? this.status,
        weatherList: weatherList ?? this.weatherList);
  }

  @override
  List<Object?> get props => [status, weatherList];
}
