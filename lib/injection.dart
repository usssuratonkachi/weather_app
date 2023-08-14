import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/domain/mappers/weather_mapper.dart';

import 'domain/repositories/weather_repository.dart';

Future<Widget> injection(Widget app) async {
  //mappers
  final cityMapper = CityMapper();
  final windMapper = WindMapper();
  final weatherMapper = WeatherMapper();
  final mainMapper = MainMapper();
  final weatherParametersMapper = WeatherParametersMapper(
      windMapper: windMapper,
      weatherMapper: weatherMapper,
      mainMapper: mainMapper);
  final weatherListMapper = WeatherListMapper(
      weatherParametersMapper: weatherParametersMapper, cityMapper: cityMapper);

  //repositories
  final weatherRepository =
      WeatherRepository(weatherListMapper: weatherListMapper);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<WeatherRepository>(create: (_) => weatherRepository),

  ], child: app);
}
