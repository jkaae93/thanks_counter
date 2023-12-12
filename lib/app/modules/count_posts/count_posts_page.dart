import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_posts_controller.dart';

class CountPostsPage extends GetView<CountPostsController> {
  const CountPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountPostsPage'),
        centerTitle: true,
      ),
      body: GetBuilder<CountPostsController>(
        builder: (c) {
          return ListView.builder(
            itemBuilder: (ctx, i) {
              return SelectableText(c.posts[i].content);
            },
            itemCount: c.posts.length,
          );
        },
      ),
    );
  }
}
