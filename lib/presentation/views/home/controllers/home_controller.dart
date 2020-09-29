import 'package:flutter/cupertino.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';
import 'package:flutterando_arquitetura/infrastructure/view_models/weather_forecast/weather_forecast_view_model.dart';

class HomeController {
  final WeatherForecastViewModel viewModel;

  HomeController({@required this.viewModel});

  ValueNotifier<WeatherForecastModel> get weatherForecast => viewModel.weatherForecastModel;

  getWeatherForecast() {
    viewModel.fill();
  }
}
