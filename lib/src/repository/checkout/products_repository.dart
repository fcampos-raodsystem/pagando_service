import 'package:paying_service/src/services/checkout_service.dart';

class ProductsRepository {
  final CheckOutService PagandoService;

  ProductsRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : PagandoService = CheckOutService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
}
