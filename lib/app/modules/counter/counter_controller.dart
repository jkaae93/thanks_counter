import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:thanks_counter/app/data/dtos/board_dto.dart';

class CounterController extends GetxController {
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
      Logger().d(file != null);
      Map<String, dynamic> json = jsonDecode(file ??'');

      datas =
          json['response'].map<BoardDto>((e) => BoardDto.fromJson(e)).toList();

      for (var d in datas) {
        d.resultData?.items?.forEach((item) {
          updateCounter(item.author?.name ?? '');
          updateEmotion(item.postNo ?? 0, item.emotionCount ?? 0);
          emotionUrl['${item.postNo ?? 0}'] = item.webUrl ?? '';
          emotionName['${item.postNo ?? 0}'] = item.author?.name ?? '';
          if (item.content!.contains('band:refer user_no')) {
            RegExp regex =
                RegExp(r'<band:refer user_no="(\d+)">(.*?)<\/band:refer>');

            Iterable<Match> matches = regex.allMatches(item.content ?? '');

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
      Logger().e(e);
    }
    update();
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

  void updateEmotion(int postNo, int emotionCount) {
    emotion['$postNo'] = emotionCount;
  }

  String getAuthors() {
    return authors.entries
        .map((e) => '\"${e.key}\", \"${e.value}\"\n')
        .toList()
        .toString();
  }

  String getEmo() {
    return emotion.entries
        .map((e) =>
            ' \"${emotionName[e.key]}\", \"${e.key}\", \"${e.value}\", ${emotionUrl[e.key]} \n')
        .toList()
        .toString();
  }

  String getMentions() {
    return mentioned.entries
        .map((e) => '\"${userNumbers[e.key]}\", \"${e.value}\"\n')
        .toList()
        .toString();
  }
}
