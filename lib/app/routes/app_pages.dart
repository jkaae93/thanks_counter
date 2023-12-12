import 'home_routes.dart';
import 'count_posts_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
		...CountPostsRoutes.routes,
  ];
}
