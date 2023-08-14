import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/repositories/authentication_repository.dart';
import 'package:weather_app/weather_app.dart';

import 'injection.dart';

class Env {
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authenticationRepository = AuthenticationRepository();
    await authenticationRepository.user.first;
    final injectionContainer = await injection(WeatherApp(
      authenticationRepository: authenticationRepository,
    ));
    runApp(injectionContainer);
  }
}
