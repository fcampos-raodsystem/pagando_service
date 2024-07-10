import 'package:paying_service/paying_export.dart';

class ProductModel {
  ProductModel({
    required this.message,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      message: json['message'].toString(),
      data: ProductData.fromJson(json['data']),
    );
  }

  final String message;
  final ProductData data;
}

class ProductData {
  ProductData({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      title: json['title'].toString(),
      description: json['description'].toString(),
      price: json['price'].toString(),
      image: Imagen.fromJson(json['image']),
      id: json['_id'].toString(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  final String title;
  final String description;
  final String price;
  final Imagen image;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
}
