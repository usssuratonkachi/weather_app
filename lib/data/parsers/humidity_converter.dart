class HumidityConverter {
  static String convertHumidity(double? h) {
    final double humidity;

    h == null ? humidity = -1 : humidity = h;

    if (humidity == -1) {
      return '';
    }
    if (humidity >= 0 && humidity <= 3) {
      return 'Безводная влажность';
    } else if (humidity >= 4 && humidity <= 9) {
      return 'Песчаная влажность';
    } else if (humidity >= 10 && humidity <= 22) {
      return 'Сухая влажность';
    } else if (humidity >= 23 && humidity <= 40) {
      return '	Низкая влажность';
    } else if (humidity >= 41 && humidity <= 52) {
      return 'Средняя влажность';
    } else if (humidity >= 53 && humidity <= 64) {
      return 'Привычная влажность';
    } else if (humidity >= 65 && humidity <= 73) {
      return 'Умеренная влажность';
    } else if (humidity >= 74 && humidity <= 81) {
      return 'Высокая влажность';
    } else if (humidity >= 82 && humidity <= 99) {
      return '	Туманная влажность';
    }

    return 'Мокрая влажность';
  }
}
