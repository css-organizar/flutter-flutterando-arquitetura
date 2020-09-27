import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: ApplicationController.instance.themeSwitch.value,
      onChanged: (value) {
        ApplicationController.instance.changeTheme(value);
      },
    );
  }
}
