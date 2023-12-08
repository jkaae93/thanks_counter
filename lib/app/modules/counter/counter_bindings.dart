import 'package:get/get.dart';
import './counter_controller.dart';

class CounterBindings implements Bindings {
    @override
    void dependencies() {
        Get.put<CounterController>(CounterController());
    }
}