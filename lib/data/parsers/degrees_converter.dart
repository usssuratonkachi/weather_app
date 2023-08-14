class DegreesConverter {
  static String convertDegrees(int? deg) {
    final int degrees;

    deg == null ? degrees = -1 : degrees = deg;

    if (degrees == -1) {
      return '';
    }
    if (degrees == 360 || (degrees > 0 && degrees < 33.75)) {
      return 'северный';
    }
    if (degrees >= 33.75 && degrees < 78.75) {
      return 'северо-западный';
    }
    if (degrees >= 78.75 && degrees < 123.75) {
      return 'западный';
    }
    if (degrees >= 123.75 && degrees < 168.75) {
      return 'юго=западный';
    }
    if (degrees >= 168.75 && degrees < 213.75) {
      return 'южный';
    }
    if (degrees >= 213.75 && degrees < 258.75) {
      return 'юго-восточный';
    }
    if (degrees >= 258.75 && degrees < 303.75) {
      return 'восточный';
    }
    if (degrees >= 303.75 && degrees < 360) {
      return 'северо-восточный';
    }
    return '';
  }
}
