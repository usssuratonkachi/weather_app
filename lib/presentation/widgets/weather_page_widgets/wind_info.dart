import 'package:flutter/cupertino.dart';

import '../../../data/parsers/degrees_converter.dart';
import '../../../ui/font_styles.dart';

class WindInfo extends StatelessWidget {
  const WindInfo(
      {required this.windSpeed, required this.windPressure, super.key});

  final double? windSpeed;
  final int? windPressure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295,
      height: 24,
      child: Row(
        children: [
          Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Wind.png'),
                      fit: BoxFit.cover))),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 56,
            child: Text(
              '${windSpeed?.toStringAsFixed(0)} м/c',
              style: UIFontStyles.B2mediumGrey,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 175,
            child: Text(
              'Ветер ${DegreesConverter.convertDegrees(windPressure)}',
              style: UIFontStyles.B2white,
            ),
          )
        ],
      ),
    );
  }
}
