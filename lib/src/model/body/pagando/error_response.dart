/// {{@template error_response}}
/// Data class for error response
/// {{@endtemplate}}
class ErrorResponse {
  /// {{@template error_response}}
  /// Data class for error response
  /// {{@endtemplate}}
  ErrorResponse({List<ErrorsData>? errors}) {
    _errors = errors;
  }

  /// {{@template error_response}}
  /// Data class for error response
  /// {{@endtemplate}}
  ErrorResponse.fromJson(dynamic json) {
    json['errors'] != null
        ? _errors = []
        : json['errors'].forEach((v) {
            _errors!.add(ErrorsData.fromJson(v));
          });
  }
}

List<ErrorsData>? _errors;

List<ErrorsData>? get errors => _errors;

/// {{@template errors_data}}
/// Data class for error response
/// {{@endtemplate}}
class ErrorsData {
  /// {{@template errors_data}}
  /// Data class for error response
  /// {{@endtemplate}}
  ErrorsData({
    String? code,
    String? timestamp,
    String? path,
    String? message,
    String? errorCode,
    String? errorDetails,
  }) {
    code = code;
    timestamp = timestamp;
    path = path;
    message = message;
    errorCode = errorCode;
    errorDetails = errorDetails;
  }

  /// {{@template errors_data}}
  /// Data class for error response
  /// [json] is the dynamic data from the API
  /// {{@endtemplate}}
  ErrorsData.fromJson(dynamic json) {
    code = json['statusCode'] != null ? json['statusCode'].toString() : '';
    timestamp = json['timestamp'] != null ? json['timestamp'].toString() : '';
    path = json['path'] != null ? json['path'].toString() : '';
    message = json['message'] != null ? json['message'].toString() : '';
    errorCode = json['errorCode'] != null ? json['errorCode'].toString() : '';
    errorDetails = json['errorDetails'] != null ? json['errorDetails'].toString() : '';
  }

  String? code;
  String? timestamp;
  String? path;
  String? message;
  String? errorCode;
  String? errorDetails;
}
