import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/font_styles.dart';

import '../../ui/colors.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[UIColors.blue, UIColors.black])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(43, 292, 0, 0),
                  child: SizedBox(
                      width: 245,
                      height: 114,
                      child: Text('WEATHER SERVICE',
                          style: UIFontStyles.loadPageMainTextFontStyle))),
              Padding(
                  padding: const EdgeInsets.only(top: 288),
                  child: SizedBox(
                    width: 250,
                    height: 32,
                    child: Text(
                      'dawn is coming soon',
                      textAlign: TextAlign.center,
                      style: UIFontStyles.loadPageSecondTextFontStyle,
                    ),
                  ))
            ]),
      ),
    );
  }
}
