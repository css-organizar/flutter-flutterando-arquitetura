import 'package:flutterando_arquitetura/infrastructure/interfaces/local_storage_interface.dart';

class SharedLocalStorageMock implements ILocalStorage {
  @override
  Future delete(String key) async {
    return true;
  }

  @override
  Future get(String key) async {
    return key;
  }

  @override
  Future put(String key, value) async {
    return true;
  }
}
