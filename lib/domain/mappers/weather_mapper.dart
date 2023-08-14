import 'package:weather_app/domain/entities/weather_entity.dart';

import '../../data/models/weather_model.dart';
import 'mapper.dart';

class CityMapper extends Mapper<CityModel, CityEntity> {
  @override
  CityEntity? map(CityModel? model) {
    return CityEntity(name: model?.name ?? '', country: model?.country ?? '');
  }
}

class WindMapper extends Mapper<WindModel, WindEntity> {
  @override
  WindEntity? map(WindModel? model) {
    return WindEntity(speed: model?.speed ?? 0, deg: model?.deg ?? 0);
  }
}

class WeatherMapper extends Mapper<WeatherModel, WeatherEntity> {
  @override
  WeatherEntity? map(WeatherModel? model) {
    return WeatherEntity(
        id: model?.id ?? 0,
        main: model?.main ?? '',
        icon: model?.icon ?? '',
        description: model?.description ?? '');
  }
}

class MainMapper extends Mapper<MainModel, MainEntity> {
  @override
  MainEntity? map(MainModel? model) {
    return MainEntity(
        temp: model?.temp ?? 0,
        temp_min: model?.temp_min ?? 0,
        temp_max: model?.temp_max ?? 0,
        humidity: model?.humidity ?? 0);
  }
}

class WeatherParametersMapper
    extends Mapper<WeatherParametersModel, WeatherParametersEntity> {
  WeatherParametersMapper(
      {required this.windMapper,
      required this.weatherMapper,
      required this.mainMapper});

  final WindMapper windMapper;
  final WeatherMapper weatherMapper;
  final MainMapper mainMapper;

  @override
  WeatherParametersEntity? map(WeatherParametersModel? model) {
    return WeatherParametersEntity(
        dt: model?.dt ?? 0,
        main: mainMapper.map(model?.main),
        weather: weatherMapper.mapList(model?.weather),
        wind: windMapper.map(model?.wind),
        dt_txt: model?.dt_txt ?? '');
  }
}

class WeatherListMapper extends Mapper<ApiWeatherModel, WeatherListEntity> {
  WeatherListMapper(
      {required this.weatherParametersMapper, required this.cityMapper});

  final CityMapper cityMapper;
  final WeatherParametersMapper weatherParametersMapper;

  @override
  WeatherListEntity? map(ApiWeatherModel? model) {
    return WeatherListEntity(
        cod: model?.cod ?? '',
        message: model?.message ?? 0,
        cnt: model?.cnt ?? 0,
        list: weatherParametersMapper.mapList(model?.list),
        city: cityMapper.map(model?.city));
  }
}
