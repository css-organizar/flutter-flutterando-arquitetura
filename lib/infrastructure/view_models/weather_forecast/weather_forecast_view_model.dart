import 'package:flutter/material.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/interfaces/api_advisor_interface.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';

class WeatherForecastViewModel {
  final IApiAdvisor repository;
  final weatherForecastModel = ValueNotifier<WeatherForecastModel>(null);

  WeatherForecastViewModel({@required this.repository});
  fill() async {
    weatherForecastModel.value = await repository.getWeatherForecast();
  }
}
