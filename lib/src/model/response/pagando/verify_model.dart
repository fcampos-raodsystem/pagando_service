/// [VerifyModel] is a model class that contains the response of the verify endpoint.
class VerifyModel {
  /// [VerifyModel] constructor
  VerifyModel({required this.message, required this.data});

  /// [VerifyModel] fromJson method
  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(
      message: json['message'].toString(),
      data: VerifyData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
    };
  }

  /// [message] is a string that contains the message of the response.
  final String message;

  /// [data] is a [VerifyData] object that contains the data of the response.
  final VerifyData data;
}

/// [VerifyData] is a model class that contains the data of the verify endpoint.
class VerifyData {
  /// [VerifyData] constructor
  VerifyData({required this.accessTokenVerify, required this.refreshTokenVerify});

  /// [VerifyData] fromJson method
  factory VerifyData.fromJson(Map<String, dynamic> json) {
    return VerifyData(
      accessTokenVerify: json['accessTokenVerify'] as bool,
      refreshTokenVerify: json['refreshTokenVerify'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessTokenVerify': accessTokenVerify,
      'refreshTokenVerify': refreshTokenVerify,
    };
  }

  /// [accessTokenVerify] is a boolean that contains the access token verify status.
  final bool accessTokenVerify;

  /// [refreshTokenVerify] is a boolean that contains the refresh token verify status.
  final bool refreshTokenVerify;
}
