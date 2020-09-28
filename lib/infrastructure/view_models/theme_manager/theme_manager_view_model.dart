import 'package:flutterando_arquitetura/infrastructure/interfaces/local_storage_interface.dart';
import 'package:flutterando_arquitetura/infrastructure/models/application_config_model.dart';

class ThemeManagerViewModel {
  final ILocalStorage storage;

  ThemeManagerViewModel({this.storage});

  final ApplicationConfigModel config = ApplicationConfigModel();

  Future init() async {
    await storage.get('isDark').then(
      (value) {
        if (value != null) {
          config.themeSwitch.value = value;
        }
      },
    );
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
