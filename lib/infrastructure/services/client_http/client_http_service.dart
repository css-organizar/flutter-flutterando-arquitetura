import 'package:dio/dio.dart';
import 'package:flutterando_arquitetura/infrastructure/interfaces/client_http_intergace.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future getWeatherForecast(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
