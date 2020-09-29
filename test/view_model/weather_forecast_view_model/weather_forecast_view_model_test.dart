import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/api_advisor_repository.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';
import 'package:flutterando_arquitetura/infrastructure/services/client_http/client_http_service.dart';
import 'package:flutterando_arquitetura/infrastructure/view_models/weather_forecast/weather_forecast_view_model.dart';
import 'package:mockito/mockito.dart';

import '../../mock/client_http_mock..dart';
import '../../mock/client_http_mockito.dart';

main() {
  test(
    'WeatherForecastViewModel with Mock',
    () async {
      final viewModel = WeatherForecastViewModel(
        repository: ApiAdvisorRepository(
          client: ClientHttpMock(),
        ),
      );

      await viewModel.fill();
      expect(viewModel.weatherForecastModel.runtimeType.toString(), "ValueNotifier<WeatherForecastModel>");
    },
  );

  test(
    'WeatherForecastViewModel with API',
    () async {
      final viewModel = WeatherForecastViewModel(
        repository: ApiAdvisorRepository(
          client: ClientHttpService(),
        ),
      );

      await viewModel.fill();
      expect(viewModel.weatherForecastModel.value, isA<WeatherForecastModel>());
    },
  );

  test(
    'WeatherForecastViewModel with Mockito',
    () async {
      final mock = ClientHttpMockito();

      final viewModel = WeatherForecastViewModel(
        repository: ApiAdvisorRepository(
          client: mock,
        ),
      );

      when(mock.getWeatherForecast(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=c00809ff1f4919fabd7bcceebf611f23"))
          .thenAnswer(
        (_) => Future.value(
          [
            WeatherForecastModel(country: "BR", date: "2020/05/30", text: "Exemplo Mock").toJson(),
          ],
        ),
      );

      await viewModel.fill();
      expect(viewModel.weatherForecastModel.value, isA<WeatherForecastModel>());
    },
  );

  test(
    'WeatherForecastViewModel with Mockito Error',
    () async {
      final mock = ClientHttpMockito();

      final viewModel = WeatherForecastViewModel(
        repository: ApiAdvisorRepository(
          client: mock,
        ),
      );

      when(mock.getWeatherForecast(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=c00809ff1f4919fabd7bcceebf611f23"))
          .thenThrow(Exception("erro"));

      await viewModel.fill();
      expect(viewModel.weatherForecastModel.value, null);
    },
  );
}
