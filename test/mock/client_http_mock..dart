import 'package:flutterando_arquitetura/infrastructure/interfaces/client_http_intergace.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';

class ClientHttpMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future getWeatherForecast(String url) async {
    return [
      WeatherForecastModel(country: "BR", date: "2020/05/30", text: "Exemplo Mock").toJson(),
    ];
  }
}
