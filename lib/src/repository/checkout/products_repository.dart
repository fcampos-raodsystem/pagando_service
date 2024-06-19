import 'package:pagando_service/pagando_service.dart';

class ProductsRepository extends RestService {
  ProductsRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> createProduct({
    required List<XFile> image,
    required String pagandoUserId,
    required String title,
    required String description,
    required String price,
  }) {
    List<MultipartFile> files = image.map((e) => MultipartFile(e.path, filename: 'image.jpg')).toList();

    return postMultipartData(
      Constants.products,
      {
        'pagandoUserId': pagandoUserId,
        'title': title,
        'description': description,
        'price': price,
      },
      files,
    );
  }
}
