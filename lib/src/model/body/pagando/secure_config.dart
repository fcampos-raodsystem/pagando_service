/// SecureConfig class
class SecureConfig {
  /// SecureConfig constructor
  SecureConfig({this.id, this.hasPassword, this.hasSecurityQuestion, this.hasTransactionPassword, this.hasSecurityImage, this.hasOtp, this.hasEmail, this.hasPhone});

  /// SecureConfig fromJson factory
  factory SecureConfig.fromJson(Map<String, dynamic> json) {
    return SecureConfig(
      id: json['_id'] != null ? json['_id'].toString() : '',
      hasPassword: json['hasPassword'] != null ? json['hasPassword'] as bool : false,
      hasSecurityImage: json['hasSecurityImage'] != null ? json['hasSecurityImage'] as bool : false,
      hasTransactionPassword: json['hasTransactionPassword'] != null ? json['hasTransactionPassword'] as bool : false,
      hasOtp: json['hasOtp'] != null ? json['hasOtp'] as bool : false,
      hasSecurityQuestion: json['hasSecurityQuestion'] != null ? json['hasSecurityQuestion'] as bool : false,
      hasEmail: json['hasEmail'] != null ? json['hasEmail'] as bool : false,
      hasPhone: json['hasPhone'] != null ? json['hasPhone'] as bool : false,
    );
  }

  /// SecureConfig id
  final String? id;

  /// SecureConfig hasPassword
  final bool? hasPassword;

  /// SecureConfig hasOtp
  final bool? hasOtp;

  /// SecureConfig hasEmail
  final bool? hasEmail;

  /// SecureConfig hasPhone
  final bool? hasPhone;

  /// SecureConfig hasSecurityQuestion
  final bool? hasSecurityQuestion;

  /// SecureConfig hasSecurityImage
  final bool? hasSecurityImage;

  /// SecureConfig hasTransactionPassword
  final bool? hasTransactionPassword;
}
