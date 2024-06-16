/// Session class
class Session {
  /// Session constructor
  Session({this.hasBiometric});

  /// Session fromJson factory
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      hasBiometric: json['hasBiometric'] != null ? json['hasBiometric'] as bool : false,
    );
  }

  /// Session hasBiometric
  final bool? hasBiometric;
}
