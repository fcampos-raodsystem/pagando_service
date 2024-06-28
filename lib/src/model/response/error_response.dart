class ErrorResponse {
  ErrorResponse({
    required this.statusCode,
    required this.errorCode,
    required this.timestamp,
    required this.path,
    required this.errors,
  });

  final int statusCode;
  final String errorCode;
  final String timestamp;
  final String path;
  final List<List<String>> errors;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
      timestamp: json['timestamp'],
      path: json['path'],
      errors: List<List<String>>.from(json['errors'].map((e) => List<String>.from(e))),
    );
  }
}
