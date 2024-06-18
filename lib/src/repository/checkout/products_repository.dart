import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:pagando_service/pagando_service.dart';

class ProductsRepository extends RestService {
  ProductsRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

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
    return postMultipartData(
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
