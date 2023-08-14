import 'package:flutter/cupertino.dart';

import '../../../data/parsers/humidity_converter.dart';
import '../../../ui/font_styles.dart';

class HumidityInfo extends StatelessWidget {
  const HumidityInfo(
      {required this.humidityPercent, required this.humidityType, super.key});

  final double? humidityPercent;
  final double? humidityType;

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
                      image: AssetImage('images/Drop.png'),
                      fit: BoxFit.cover))),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 56,
            child: Text(
              '${humidityPercent?.toStringAsFixed(0)}%',
              style: UIFontStyles.B2mediumGrey,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            HumidityConverter.convertHumidity(humidityType),
            style: UIFontStyles.B2white,
          )
        ],
      ),
    );
  }
}
