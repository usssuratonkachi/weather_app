import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/parsers/weather_condition_to_small_icon_parser.dart';
import 'package:weather_app/ui/font_styles.dart';

class WeatherListElement extends StatelessWidget {
  const WeatherListElement(
      {required this.time,
      required this.icon,
      required this.temperature,
      super.key});

  final String? time;
  final String? icon;
  final double? temperature;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 142,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 42,
            height: 22,
            child: Text(
              '$time',
              style: UIFontStyles.B2white,
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'images/${WeatherConditionToSmallIconParser.convertConditionToSmallIcon(icon)}'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 42,
            height: 24,
            child: Center(
                child: Text('${temperature?.toStringAsFixed(0)}°',
                    style: UIFontStyles.B1medium)),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
