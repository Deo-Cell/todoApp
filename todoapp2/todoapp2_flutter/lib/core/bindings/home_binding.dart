import 'package:get/get.dart';
import 'package:todoapp2_flutter/home/home_controller.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';

class HomeBinding extends MBindingsBuilder {
  HomeBinding()
      : super(() => [
              Bind.lazyPut<HomeController>(() => HomeController()),
            ]);
}
