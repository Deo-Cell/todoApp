import 'package:get/get.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/settings/presentation/controller/settings_controller.dart';

class SettingsBinding extends MBindingsBuilder {
  SettingsBinding()
      : super(() => [
              Bind.lazyPut<SettingsController>(() => SettingsController()),
            ]);
}
