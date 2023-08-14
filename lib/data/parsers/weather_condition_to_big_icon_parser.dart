class WeatherConditionToBigIconParser{
  static String convertConditionToBigIcon(String? weatherCondition) {
    switch (weatherCondition) {
      case 'Rain':
        return 'rain.png';
      case 'Snow':
        return 'snow.png';
      case 'Clouds':
        return 'clouds.png';
      case 'Drizzle':
        return 'clouds.png';
      case 'Thunderstorm':
        return 'thunderstorm.png';
    }
    return 'clear.png';
  }
}