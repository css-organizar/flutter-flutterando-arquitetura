import 'package:flutter/foundation.dart';
import 'package:flutterando_arquitetura/infrastructure/models/application_config_model.dart';

//Singleton

class ApplicationController {
  //Proprietade da instância do singleton
  //Chama o construtor privado, retorna sua instância e por ser final
  //Não aceita alterações
  static final ApplicationController instance = ApplicationController._();

  //Construtor privado
  //Acesso apenas dentro da classe
  //Evita que se possa criar uma instância do singleton
  ApplicationController._();

  final ApplicationConfigModel config = ApplicationConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    config.themeSwitch.value = value;
  }
}
