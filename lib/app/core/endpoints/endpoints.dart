import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:thanks_counter/app/data/dtos/board_dto.dart';
import 'package:thanks_counter/app/utils/log.dart';
import 'package:thanks_counter/constants.dart';

class Endpoints {
  static Endpoints? _instance;
  static late Client client;
  final String _host = 'https://openapi.band.us/v2/band';
  final Map<String, String> _header = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS, GET",
    "Content-Type": "text/plain",
  };

  Endpoints._() {
    client = http.Client();
  }
  static Endpoints get instance => _instance ??= Endpoints._();

  /// [GET] https://openapi.band.us/v2/band/posts
  /// Parameter
  Future<BoardDto?> getPosts() async {
    try {
      Map<String, String> query = {
        'access_token': accessToken,
        'band_key': bandKey,
        'locale': 'ko_KR',
      };

      Uri uri = Uri.parse('$_host/posts');
      uri.replace(queryParameters: query);

      Response response = await http.get(uri, headers: _header);
      Map<String, dynamic> json = jsonDecode(response.body);

      return BoardDto.fromJson(json);
    } catch (e) {
      Log.e(e);
      return null;
    }
  }

  Future<BoardDto?> getPostsNext(String after) async {
    try {
      Map<String, String> query = {
        'access_token': accessToken,
        'band_key': bandKey,
        'after': after,
      };
      Uri uri = Uri.parse('$_host/post');
      uri.replace(queryParameters: query);

      Response response = await client.get(uri, headers: _header);
      Map<String, dynamic> json = jsonDecode(response.body);

      return BoardDto.fromJson(json);
    } catch (e) {
      Log.e(e);
      return null;
    }
  }

  /// [GET] https://openapi.band.us/v2/band/post/comments
  Future<dynamic> getPostsDetail(String postKey) async {
    // TODO: get reply list
    try {
      Map<String, String> query = {
        'access_token': accessToken,
        'band_key': bandKey,
        'post_key': postKey,
      };
      Uri uri = Uri.parse('$_host/post');
      uri.replace(queryParameters: query);
      Response response = await client.get(uri, headers: _header);
      Map<String, dynamic> json = jsonDecode(response.body);
      return BoardDto.fromJson(json);
    } catch (e) {
      Log.e(e);
    }
  }

  /// [GET] https://openapi.band.us/v2/band/post/comments
  Future<dynamic> getCommnets(String boardId) async {
    try {
      Map<String, String> query = {
        'access_token': accessToken,
        'band_key': bandKey,
        'post_key': postKey,
      };
      Uri uri = Uri.parse('$_host/post/comments');
      uri.replace(queryParameters: query);
      client.get(uri);
    } catch (e) {
      Log.e(e);
    }
  }

  /// [GET] https://openapi.band.us/v2/band/post/comments
  Future<dynamic> getNextCommnets(String after) async {
    try {
      Map<String, String> query = {
        'access_token': accessToken,
        'band_key': bandKey,
        'post_key': postKey,
        'after': after,
      };
      Uri uri = Uri.parse('$_host/post/comments');
      uri.replace(queryParameters: query);
      client.get(uri);
    } catch (e) {
      Log.e(e);
    }
  }
}
