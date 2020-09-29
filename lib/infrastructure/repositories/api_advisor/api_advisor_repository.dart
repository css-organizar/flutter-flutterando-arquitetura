import 'package:flutter/material.dart';
import 'package:flutterando_arquitetura/infrastructure/interfaces/client_http_intergace.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';

import 'interfaces/api_advisor_interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository({@required this.client});

  @override
  Future<WeatherForecastModel> getWeatherForecast() async {
    var json = await client.getWeatherForecast(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=c00809ff1f4919fabd7bcceebf611f23");
    WeatherForecastModel model = WeatherForecastModel.fromJson(json[0]);
    return model;
  }
}
