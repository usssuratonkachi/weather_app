import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/pages/load_page.dart';
import 'package:weather_app/presentation/widgets/weather_page_widgets/blured_purple_circle.dart';
import 'package:weather_app/presentation/widgets/weather_page_widgets/humidity_info.dart';
import 'package:weather_app/presentation/widgets/weather_page_widgets/wind_info.dart';
import 'package:weather_app/ui/font_styles.dart';

import '../../data/parsers/date_converter.dart';
import '../../ui/colors.dart';
import '../widgets/weather_page_widgets/location.dart';
import '../widgets/weather_page_widgets/weather_icon.dart';
import '../widgets/weather_page_widgets/weather_list_element.dart';
import 'error_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: WeatherPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherPageView(),
    );
  }
}

class WeatherPageView extends StatefulWidget {
  const WeatherPageView({super.key});

  @override
  State<WeatherPageView> createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  @override
  void initState() {
    context.read<WeatherCubit>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state.status.isSuccess) {
          return Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[UIColors.darkBlue, UIColors.black])),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 44, 0, 24),
                        child: Location(
                          city: state.weatherList?.city?.name,
                          country: state.weatherList?.city?.country,
                        )),
                    Stack(alignment: Alignment.center, children: [
                      const BluredPurpleCircle(),
                      WeatherIcon(
                          weatherCondition:
                              state.weatherList?.list?[0].weather?[0].main)
                    ]),
                    Container(
                        alignment: Alignment.center,
                        width: 327,
                        height: 72,
                        child: Center(
                          child: Text(
                              '${state.weatherList?.list?[0].main?.temp?.toStringAsFixed(0)}°',
                              style: UIFontStyles.mainTemperatureFont),
                        )),
                    Container(
                      height: 24,
                      alignment: Alignment.center,
                      child: Text(
                        '${state.weatherList?.list?[0].weather?[0].description}',
                        style: UIFontStyles.B1white,
                      ),
                    ),
                    Container(
                        height: 24,
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Макс:${state.weatherList?.list?[0].main?.temp_max?.toStringAsFixed(0)}°',
                                  style: UIFontStyles.B1white),
                              TextSpan(
                                  text:
                                      ' Мин:${state.weatherList?.list?[0].main?.temp_min?.toStringAsFixed(0)}°',
                                  style: UIFontStyles.B1white),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 327,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: UIColors.transparentPurple,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,
                            width: 295,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 66,
                                  height: 24,
                                  child: Text(
                                    'Сегодня',
                                    style: UIFontStyles.B1medium,
                                  ),
                                ),
                                Text(
                                  DateParser.convertDateToDay(
                                      '${state.weatherList?.list?[0].dt_txt}'),
                                  style: UIFontStyles.B1medium,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 327,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                            child: SizedBox(
                              width: 327,
                              height: 158,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.weatherList?.cnt,
                                  itemBuilder: (context, index) {
                                    return WeatherListElement(
                                        icon:
                                            '${state.weatherList?.list?[index].weather?[0].main}',
                                        time: DateParser.convertDateToTime(
                                            '${state.weatherList?.list?[index].dt_txt}'),
                                        temperature: state.weatherList
                                            ?.list?[index].main?.temp);
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 327,
                      height: 96,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: UIColors.transparentPurple,
                        ),
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                child: WindInfo(
                                  windSpeed:
                                      state.weatherList?.list?[0].wind?.speed,
                                  windPressure:
                                      state.weatherList?.list?[0].wind?.deg,
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: HumidityInfo(
                                humidityPercent:
                                    state.weatherList?.list?[0].main?.humidity,
                                humidityType:
                                    state.weatherList?.list?[0].main?.humidity,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
        }
        if (state.status.isLoading) {
          return const LoadPage();
        }
        return ErrorPage(refresh: () => initState());
      },
    );
  }
}
