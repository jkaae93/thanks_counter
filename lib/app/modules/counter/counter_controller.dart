import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:thanks_counter/app/core/endpoints/endpoints.dart';
import 'package:thanks_counter/app/data/dtos/board_dto.dart';
import 'package:thanks_counter/app/utils/log.dart';
import 'package:thanks_counter/model/post.dart';

class CounterController extends GetxController {
  List<Post> posts = [];
  bool _calling = false;
  List<BoardDto> datas = [];
  Map<String, int> authors = {};
  Map<String, int> emotion = {};
  Map<String, String> emotionUrl = {};
  Map<String, String> emotionName = {};
  Map<String, String> userNumbers = {};
  Map<String, int> mentioned = {};

  CounterController();

  Future<void> init({String? file}) async {
    try {
      Log.d(file != null);
      Map<String, dynamic> json = jsonDecode(file ??'');

      datas =
          json['response'].map<BoardDto>((e) => BoardDto.fromJson(e)).toList();

      for (var d in datas) {
        d.resultData?.items?.forEach((item) {
          updateCounter(item.author.name);
          updateEmotion(item.postKey, item.emotionCount);
          emotionUrl[item.postKey] = item.postKey;
          emotionName[item.postKey] = item.author.name;
          if (item.content.contains('band:refer user_no')) {
            RegExp regex =
                RegExp(r'<band:refer user_no="(\d+)">(.*?)<\/band:refer>');

            Iterable<Match> matches = regex.allMatches(item.content);

            for (Match match in matches) {
              String userNo = match.group(1)!;
              String content = match.group(2)!;
              userNumbers[userNo] = content;
              updateCountUser(userNo);
            }
          }
        });
      }
    } catch (e) {
      Log.e(e);
    }
    update();
  }

  void counter(List<Post> datas) {
    for (var d in datas) {
      updateCounter(d.author.name);
      updateEmotion(d.postKey, d.emotionCount);
      emotionUrl[d.postKey] = d.postKey;
      emotionName[d.postKey] = d.author.name;
      if (d.content.contains('band:refer user_no')) {
        RegExp regex = RegExp(r'<band:refer user_no="(\d+)">(.*?)<\/band:refer>');

        Iterable<Match> matches = regex.allMatches(d.content);

        for (Match match in matches) {
          String userNo = match.group(1)!;
          String content = match.group(2)!;
          userNumbers[userNo] = content;
          updateCountUser(userNo);
        }
      }
    }
  }

  void updateCounter(String name) {
    int count = authors[name] ?? 0;
    count++;
    authors[name] = count;
  }

  void updateCountUser(String userNum) {
    int count = mentioned[userNum] ?? 0;
    count++;
    mentioned[userNum] = count;
  }

  void updateEmotion(String postNo, int emotionCount) {
    emotion[postNo] = emotionCount;
  }

  String getAuthors() {
    return authors.entries.map((e) => '"${e.key}", "${e.value}"\n').toList().toString();
  }

  String getEmo() {
    return emotion.entries.map((e) => ' "${emotionName[e.key]}", "${e.key}", "${e.value}", ${emotionUrl[e.key]} \n').toList().toString();
  }

  String getMentions() {
    return mentioned.entries.map((e) => '"${userNumbers[e.key]}", "${e.value}"\n').toList().toString();
  }
}
