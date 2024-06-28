import 'package:paying_service/paying_service.dart';

class LinkLastedModel {
  LinkLastedModel({
    required this.message,
    required this.data,
  });

  factory LinkLastedModel.fromJson(Map<String, dynamic> json) {
    return LinkLastedModel(
      message: json['message'].toString(),
      data: List<LinkLastedData>.from(json['data'].map((x) => LinkLastedData.fromJson(x))),
    );
  }

  final String message;
  final List<LinkLastedData> data;
}

class LinkLastedData {
  LinkLastedData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pagandoUserId,
    this.url,
    required this.products,
  });

  factory LinkLastedData.fromJson(Map<String, dynamic> json) {
    return LinkLastedData(
      id: json['_id'].toString(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      pagandoUserId: json['pagandoUserId'].toString(),
      url: json['url'],
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
    );
  }

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String pagandoUserId;
  final String? url;
  final List<Product> products;
}