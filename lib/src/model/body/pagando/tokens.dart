class Tokens{
  /// DataVerifyOTPModel constructor
  Tokens({required this.accessToken, required this.refreshToken});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accessToken: json['accessToken'].toString(),
      refreshToken: json['refreshToken'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }

  /// A string that contains the access token.
  String accessToken;

  /// A string that contains the refresh token.
  String refreshToken;
}
