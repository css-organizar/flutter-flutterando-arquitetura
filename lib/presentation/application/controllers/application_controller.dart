import 'package:flutter/foundation.dart';
import 'package:flutterando_arquitetura/infrastructure/interfaces/local_storage_interface.dart';
import 'package:flutterando_arquitetura/infrastructure/models/application_config_model.dart';
import 'package:flutterando_arquitetura/infrastructure/services/shared_preferences/shared_local_storage_Service.dart';
import 'package:flutterando_arquitetura/infrastructure/view_models/theme_manager/theme_manager_view_model.dart';

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
    themeManagerViewModel.init();
  }

  final ThemeManagerViewModel themeManagerViewModel = ThemeManagerViewModel(
    storage: SharedLocalStorageService(),
  );

  bool get isDark => themeManagerViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => themeManagerViewModel.config.themeSwitch;
}
