import 'package:get/get.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/pomodoro/presentation/controller/pomodoro_controller.dart';

class PodomoroBinding extends MBindingsBuilder {
  PodomoroBinding()
      : super(() => [
              Bind.lazyPut<PomodoroController>(() => PomodoroController()),
            ]);
}
