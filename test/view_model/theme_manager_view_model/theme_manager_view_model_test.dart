import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_arquitetura/infrastructure/view_models/theme_manager/theme_manager_view_model.dart';

import '../../mock/shared_local_storage_mock.dart';

main() {
  test('ThemeManagerViewModel Get', () async {
    final viewModel = ThemeManagerViewModel(
      storage: SharedLocalStorageMock(),
    );

    var testeGet = await viewModel.storage.get("key");
    expect(testeGet, "key");
  });

  test('ThemeManagerViewModel Delete', () async {
    final viewModel = ThemeManagerViewModel(
      storage: SharedLocalStorageMock(),
    );

    var testDelete = await viewModel.storage.delete("key");
    expect(testDelete, true);
  });

  test('ThemeManagerViewModel Put', () async {
    final viewModel = ThemeManagerViewModel(
      storage: SharedLocalStorageMock(),
    );

    var testPut = await viewModel.storage.put("key", "key");
    expect(testPut, true);
  });
}
