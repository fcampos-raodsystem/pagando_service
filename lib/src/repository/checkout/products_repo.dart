import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:get/get.dart';

class ProductsRepo {
  ProductsRepo({required this.apiClient});

  final RestService apiClient;

  Future<Response<dynamic>> createProduct({
    required XFile image,
    required String pagandoUserId,
    required String title,
    required String description,
    required String price,
  }) {
    final multipartBody = <MultipartBody>[
      MultipartBody('image', image),
    ];
    return apiClient.postMultipartData(
      Constants.products,
      {
        'pagandoUserId': pagandoUserId,
        'title': title,
        'description': description,
        'price': price,
      },
      multipartBody,
    );
  }
}
