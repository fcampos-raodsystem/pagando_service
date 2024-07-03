import 'package:paying_service/service.dart';

class LinksRepository {
  final RestService restService;

  LinksRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
  

  Future<Response<dynamic>> createLinks({required String userId, required List<String> productIds}) {
    return restService.postData(
      Constants.links,
      {
        "pagandoUserId": userId,
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> setProductsToLink({required String linkId, required List<String> productIds}) {
    return restService.postData(
      '${Constants.links}/$linkId',
      {
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> getLastedLink({required String userId}) {
    return restService.getData('${Constants.links}/latest?pagandoUserId=$userId');
  }
}
