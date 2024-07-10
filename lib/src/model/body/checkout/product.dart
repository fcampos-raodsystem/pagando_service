import 'package:paying_service/paying_export.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.countNumber,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      description: json['description'].toString(),
      price: json['price'].toString(),
      countNumber: json['countNumber'].toString(),
      image: json['image'] != null ? Imagen.fromJson(json['image']) : null,
    );
  }

  final String id;
  final String title;
  final String description;
  final String price;
  final String countNumber;
  final Imagen? image;
}
