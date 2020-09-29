abstract class IClientHttp {
  void addToken(String token);
  Future getWeatherForecast(String url);
}
