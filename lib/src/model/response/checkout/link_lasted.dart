import 'package:paying_service/paying_export.dart';

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
    required this.pagandoUserId,
    required this.url,
    required this.products,
  });

  factory LinkLastedData.fromJson(Map<String, dynamic> json) {
    return LinkLastedData(
      id: json['_id'].toString(),
      pagandoUserId: json['pagandoUserId'].toString(),
      url: json['url'],
      products: json['products'] != null ? List<Product>.from(json['products'].map((x) => Product.fromJson(x))) : [],
    );
  }

  final String id;
  final String pagandoUserId;
  final String url;
  final List<Product> products;
}
