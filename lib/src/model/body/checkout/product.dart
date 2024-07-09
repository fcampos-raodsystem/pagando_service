import 'package:paying_service/service.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      description: json['description'].toString(),
      price: json['price'].toString(),
      image: json['image'] != null ? Imagen.fromJson(json['image']) : null,
    );
  }

  final String id;
  final String title;
  final String description;
  final String price;
  final Imagen? image;
}
