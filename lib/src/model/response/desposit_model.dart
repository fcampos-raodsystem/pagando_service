/// DepositModel
class DepositModel {
  /// DepositModel constructor
  DepositModel({
    required this.statusCode,
    required this.errorCode,
    required this.timestamp,
    required this.path,
    required this.message,
  });

  /// DepositModel fromJson
  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      statusCode: json['statusCode'] != null ? json['statusCode'] as int : 0,
      errorCode: json['errorCode'] != null ? json['errorCode'] as String : '',
      timestamp: json['timestamp'] != null ? json['timestamp'] as String : '',
      path: json['path'] != null ? json['path'] as String : '',
      message: json['message'] != null ? json['message'] as String : '',
    );
  }

  /// [statusCode] from DepositModel
  final int statusCode;

  /// [errorCode] from DepositModel
  final String errorCode;

  /// [timestamp] from DepositModel
  final String timestamp;

  /// [path] from DepositModel
  final String path;

  /// [message] from DepositModel
  final String message;
}
