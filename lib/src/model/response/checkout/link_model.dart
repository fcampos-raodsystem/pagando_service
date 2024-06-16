class LinkModel {
  LinkModel({
    required this.message,
    required this.data,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      message: json['message'].toString(),
      data: LinkData.fromJson(json['data']),
    );
  }

  final String message;
  final LinkData data;
}

class LinkData {
  LinkData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pagandoUserId,
    this.url,
    required this.products,
  });

  factory LinkData.fromJson(Map<String, dynamic> json) {
    return LinkData(
      id: json['_id'].toString(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      pagandoUserId: json['pagandoUserId'].toString(),
      url: json['url'],
      products: List<String>.from(json['products'].map((x) => x)),
    );
  }

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String pagandoUserId;
  final String? url;
  final List<String> products;
}