class WeatherConditionToSmallIconParser{
  static String convertConditionToSmallIcon(String? weatherCondition) {
    switch (weatherCondition) {
      case 'Rain':
        return 'small_rain.png';
      case 'Snow':
        return 'small_snow.png';
      case 'Clouds':
        return 'small_clouds.png';
      case 'Drizzle':
        return 'small_clouds.png';
      case 'Thunderstorm':
        return 'small_thunderstorm.png';
    }
    return 'small_clear.png';
  }
}