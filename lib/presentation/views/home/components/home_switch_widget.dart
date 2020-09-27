import 'package:flutter/material.dart';
import 'package:flutterando_arquitetura/presentation/application/controllers/application_controller.dart';

class HomeSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: ApplicationController.instance.isDark,
      onChanged: (value) {
        ApplicationController.instance.changeTheme(value);
      },
    );
  }
}
