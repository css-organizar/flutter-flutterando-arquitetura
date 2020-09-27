import 'package:flutter/foundation.dart';

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

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
