/// {{@template balance}}
/// Data class for balance
/// [id] is the id of the balance
/// [blocked] is the blocked amount
/// [available] is the available amount
/// [deferred] is the deferred amount
/// {{@endtemplate}}
class Balance {
  /// {{@template balance}}
  /// Data class for balance
  /// {{@endtemplate}}
  Balance({
    this.id,
    this.blocked,
    this.available,
    this.deferred,
  });

  /// {{@template balance}}
  /// Data class for balance
  /// {{@endtemplate}}
  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      id: json['_id'] == null ? '' : json['_id'].toString(),
      blocked: json['blocked'] == null ? '' : json['blocked'].toString(),
      available: json['available'] == null ? '' : json['available'].toString(),
      deferred: json['deferred'] == null ? '' : json['deferred'].toString(),
    );
  }

  /// [id] is the id of the balance
  final String? id;

  /// [blocked] is the blocked amount
  final String? blocked;

  /// [available] is the available amount
  final String? available;

  /// [deferred] is the deferred amount
  final String? deferred;
}
