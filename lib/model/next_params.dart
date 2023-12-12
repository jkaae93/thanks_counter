class NextParams {
  final String accessToken;
  final String bandKey;
  final String limit;
  final String after;

  NextParams({
    required this.accessToken,
    required this.bandKey,
    required this.limit,
    required this.after,
  });

  factory NextParams.fromJson(Map<String, dynamic> json) {
    return NextParams(
      accessToken: json['access_token'] ?? '',
      bandKey: json['band_key'] ?? '',
      limit: json['limit'] ?? '',
      after: json['after'] ?? '',
    );
  }
}
