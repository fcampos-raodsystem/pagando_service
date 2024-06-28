
class Balance {
  Balance({
    this.id,
    this.blocked,
    this.available,
    this.deferred,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      id: json['_id'] == null ? '' : json['_id'].toString(),
      blocked: json['blocked'] == null ? '' : json['blocked'].toString(),
      available: json['available'] == null ? '' : json['available'].toString(),
      deferred: json['deferred'] == null ? '' : json['deferred'].toString(),
    );
  }

  final String? id;

  final String? blocked;

  final String? available;

  final String? deferred;
}
