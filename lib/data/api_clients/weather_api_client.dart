import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/geolocation.dart';

import '../models/weather_model.dart';

class WeatherRequestFailure implements Exception {}

class WeatherApiClient {
  WeatherApiClient({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'api.openweathermap.org';
  static const _appId = '055da2952248e418494689854a67d7a9';
  static const _cnt = 4;
  static const _lang = 'ru';
  static const _units = 'metric';

  Future<ApiWeatherModel> getWeather() async {
    final currentPosition = await Geolocation.determinePosition();
    final weatherRequest = Uri.https(_baseUrl, '/data/2.5/forecast', {
      'lat': currentPosition.latitude.toStringAsFixed(2),
      'lon': currentPosition.longitude.toStringAsFixed(2),
      'appid': _appId,
      'cnt': '$_cnt',
      'lang': _lang,
      'units': _units
    });

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final weatherJson = jsonDecode(weatherResponse.body);

    return ApiWeatherModel.fromJson(weatherJson);
  }
}
