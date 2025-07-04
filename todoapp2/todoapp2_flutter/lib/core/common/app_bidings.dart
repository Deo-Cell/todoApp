import 'package:get/get.dart';

class MBindingBuilder extends BindingsInterface<Bind> {
  final Bind Function() builder;
  MBindingBuilder(this.builder);


  @override
  Bind dependencies() {
    return builder();
  }
}
class MBindingsBuilder extends BindingsInterface<List<Bind>> {
  List<Bind> Function() builder;
  MBindingsBuilder(this.builder);

  @override
  List<Bind> dependencies() {
   return builder();
  }

}
