import 'package:flutter/material.dart';
import 'package:flutterando_arquitetura/presentation/application/controllers/application_controller.dart';
import 'package:flutterando_arquitetura/presentation/views/home/home_view.dart';

class ApplicationWidget extends StatefulWidget {
  @override
  _ApplicationWidgetState createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ApplicationController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
          home: HomeView(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
