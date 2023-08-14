import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/parsers/weather_condition_to_big_icon_parser.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.weatherCondition});

  final String? weatherCondition;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/${WeatherConditionToBigIconParser.convertConditionToBigIcon(weatherCondition)}'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
