import 'package:intl/intl.dart';

class DateParser {
  static String convertDateToTime(String date) {
    //print('поступило: $date'); // String
    final parsedTime = DateTime.parse(date); // стало DateTime
    // print('перевели в дейт тайм: $parsedTime');
    final formattedDate = DateFormat('kk:mm').format(parsedTime);
    //print('отформатировали дату: $formattedDate'); // DateTime

    if (formattedDate == '24:00') {
      return '00:00';
    } else {
      return formattedDate;
    }
  }

  static String convertDateToDay(String date) {
    final parsedTime = DateTime.parse(date);
    final String day = '${parsedTime.day}';
    final String month = '${parsedTime.month}';
    switch (month) {
      case '1':
        return '$day января';
      case '2':
        return '$day февраля';
      case '3':
        return '$day марта';
      case '4':
        return '$day апреля';
      case '5':
        return '$day мая';
      case '6':
        return '$day июня';
      case '7':
        return '$day июля';
      case '8':
        return '$day августа';
      case '9':
        return '$day сентября';
      case '10':
        return '$day октября';
      case '11':
        return '$day ноября';
      case '12':
        return '$day декабря';
    }
    return '';
  }
}
