import 'package:flutter/widgets.dart';
import 'package:weather_app/presentation/blocs/app_bloc/app_bloc.dart';
import 'package:weather_app/presentation/pages/login_page.dart';
import 'package:weather_app/presentation/pages/weather_page.dart';


List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:
      return [WeatherPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}