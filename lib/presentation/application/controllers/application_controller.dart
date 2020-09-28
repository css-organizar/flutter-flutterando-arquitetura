import 'package:flutter/foundation.dart';
import 'package:flutterando_arquitetura/infrastructure/interfaces/local_storage_interface.dart';
import 'package:flutterando_arquitetura/infrastructure/models/application_config_model.dart';
import 'package:flutterando_arquitetura/infrastructure/services/shared_preferences/shared_local_storage_Service.dart';

//Singleton

class ApplicationController {
  //Proprietade da instância do singleton
  //Chama o construtor privado, retorna sua instância e por ser final
  //Não aceita alterações
  static final ApplicationController instance = ApplicationController._();

  //Construtor privado
  //Acesso apenas dentro da classe
  //Evita que se possa criar uma instância do singleton
  ApplicationController._() {
    configStorage.get('isDark').then(
      (value) {
        if (value != null) {
          config.themeSwitch.value = value;
        }
      },
    );
  }

  final ApplicationConfigModel config = ApplicationConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage configStorage = SharedLocalStorageService();

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    configStorage.put('isDark', value);
  }
}
