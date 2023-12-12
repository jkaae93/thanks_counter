import 'post.dart';

class PostResponse {
  final int resultCode;
  final Map<String, List<Post>> resultData;

  PostResponse({
    this.resultCode = 0,
    this.resultData = const {},
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      resultCode: json['result_code'] ?? 0,
      resultData: json['result_data'],
    );
  }

  @override
  String toString() => {}.toString();
}
