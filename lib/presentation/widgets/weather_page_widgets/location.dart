import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/colors.dart';

import '../../../ui/font_styles.dart';
import '../../blocs/app_bloc/app_bloc.dart';

class Location extends StatelessWidget {
  const Location({super.key, required this.city, required this.country});

  final String? city;
  final String? country;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/pin.png'), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '$city, $country',
            style: UIFontStyles.B2medium,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 147),
              child: SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    onPressed: () {
                      context.read<AppBloc>().add(const AppLogoutRequested());
                    },
                    icon: Icon(
                      Icons.login_outlined,
                      color: UIColors.white,
                    ),
                  ))),
        ],
      ),
    );
  }
}
