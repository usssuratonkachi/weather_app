import 'package:weather_app/data/api_clients/weather_api_client.dart';

import '../entities/weather_entity.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepository {
  WeatherRepository(
      {required this.weatherListMapper, WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherListMapper weatherListMapper;
  final WeatherApiClient _weatherApiClient;

  Future<WeatherListEntity?> getWeather() async {
    final weather = await _weatherApiClient.getWeather();
    
    return weatherListMapper.map(weather);
  }
}
