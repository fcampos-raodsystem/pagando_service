/// [OtpModel] is a model class that contains the response of the OTP request.
class OtpModel {
  /// Constructor for the [OtpModel] class.
  OtpModel({required this.message, required this.data});

  /// Factory method to create an [OtpModel] object from a JSON object.
  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataOtp.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// [message] is a message that is returned from the server.
  final String message;

  /// [data] is a [DataOtp] object that contains the OTP data.
  final DataOtp? data;
}

/// [DataOtp] is a model class that contains the OTP data.
class DataOtp {
  /// Constructor for the [DataOtp] class.
  DataOtp(
    this.id,
    this.createdAt,
    this.code,
    this.sendByEmail,
    this.sendByWhatsapp,
    this.sendBySms,
    this.sendByTelegram,
  );

  /// Factory method to create a [DataOtp] object from a JSON object.
  factory DataOtp.fromJson(Map<String, dynamic> json) {
    return DataOtp(
      json['_id'] != null ? json['_id'].toString() : '',
      json['createdAt'] != null ? json['createdAt'].toString() : '',
      json['code'] != null ? json['code'].toString() : '',
      json['sendByEmail'] != null ? json['sendByEmail'] as bool : false,
      json['sendByWhatsapp'] != null ? json['sendByWhatsapp'] as bool : false,
      json['sendBySms'] != null ? json['sendBySms'] as bool : false,
      json['sendByTelegram'] != null ? json['sendByTelegram'] as bool : false,
    );
  }

  /// [id] is the OTP id.
  String? id;

  /// [createdAt] is the date and time when the OTP was created.
  String? createdAt;

  /// [code] is the OTP code.
  String? code;

  /// [sendByEmail] is a boolean value that indicates whether the OTP was sent by email.
  bool? sendByEmail;

  /// [sendByWhatsapp] is a boolean value that indicates whether the OTP was sent by WhatsApp.
  bool? sendByWhatsapp;

  /// [sendBySms] is a boolean value that indicates whether the OTP was sent by SMS.
  bool? sendBySms;

  /// [sendByTelegram] is a boolean value that indicates whether the OTP was sent by Telegram.
  bool? sendByTelegram;
}
