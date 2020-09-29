import 'package:flutter/material.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/api_advisor_repository.dart';
import 'package:flutterando_arquitetura/infrastructure/repositories/api_advisor/models/weather_forecast_model.dart';
import 'package:flutterando_arquitetura/infrastructure/services/client_http/client_http_service.dart';
import 'package:flutterando_arquitetura/infrastructure/view_models/weather_forecast/weather_forecast_view_model.dart';
import 'package:flutterando_arquitetura/presentation/views/home/components/home_switch_widget.dart';
import 'package:flutterando_arquitetura/presentation/views/home/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;
  HomeController controller = HomeController(
    viewModel: WeatherForecastViewModel(
      repository: ApiAdvisorRepository(
        client: ClientHttpService(),
      ),
    ),
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: HomeSwitchWidget(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        controller.getWeatherForecast();
                      },
                      child: Text("Executar"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ValueListenableBuilder(
                      valueListenable: controller.weatherForecast,
                      builder: (context, value, child) {
                        if (value?.text == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Text(
                          value.text,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
