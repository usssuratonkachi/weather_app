import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather() async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weatherList = await _weatherRepository.getWeather();
      emit(state.copyWith(
          status: WeatherStatus.success, weatherList: weatherList));
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
