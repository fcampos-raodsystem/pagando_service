import 'package:paying_service/service.dart';

class ProductsRepository{
  final RestService _restService;

  ProductsRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
}
