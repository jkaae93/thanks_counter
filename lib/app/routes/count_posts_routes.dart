import 'package:get/get.dart';

import '../modules/count_posts/count_posts_binding.dart';
import '../modules/count_posts/count_posts_page.dart';

class CountPostsRoutes {
  CountPostsRoutes._();

  static const countPosts = '/count-posts';

  static final routes = [
    GetPage(
      name: countPosts,
      page: () => const CountPostsPage(),
      binding: CountPostsBinding(),
    ),
  ];
}
