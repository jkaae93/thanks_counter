import 'package:get/get.dart';

import 'count_posts_controller.dart';

class CountPostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountPostsController>(
      () => CountPostsController(),
    );
  }
}
