import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:thanks_counter/app/core/endpoints/Endpoints.dart';
import 'package:thanks_counter/app/utils/log.dart';
import 'package:thanks_counter/model/post.dart';

class CountPostsController extends GetxController {
  List<Post> posts = [];
  bool _calling = false;

  Map<String, int> authors = {};
  Map<String, int> emotion = {};
  Map<String, String> emotionUrl = {};
  Map<String, String> emotionName = {};
  Map<String, String> userNumbers = {};
  Map<String, int> mentioned = {};

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getPosts() {
    Endpoints.instance.getPosts().then((resp) {
      try {
        posts.addAll(resp!.resultData!.items ?? []);
        if (resp.resultData!.paging!.nextParams!.after.isNotEmpty) {
          _calling = true;
          getNext(resp.resultData!.paging!.nextParams!.after, (p0) {
            posts.addAll(p0);
          });
        }
      } catch (e) {
        Log.e(e);
      }
    });
  }

  void getNext(String after, Function(List<Post>) callback) async {
    await Endpoints.instance.getPostsNext(after).then((next) {
      posts.addAll(next!.resultData!.items ?? []);
      if (next.resultData!.paging!.nextParams!.after.isNotEmpty) {
        getNext(after, callback);
      } else {
        _calling = false;
        update();
      }
    });
  }
}
