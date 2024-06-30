class VerifyModel {
  VerifyModel({required this.message, required this.data});

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

  final String message;
  final VerifyData data;
}

class VerifyData {
  VerifyData({required this.accessTokenVerify, required this.refreshTokenVerify});

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

  final bool accessTokenVerify;

  final bool refreshTokenVerify;
}
