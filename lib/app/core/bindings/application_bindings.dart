import 'package:get/get.dart';
import 'package:thanks_counter/app/modules/counter/counter_bindings.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CounterBindings>(CounterBindings());
  }
}
