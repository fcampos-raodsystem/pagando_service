import 'package:paying_service/service.dart';

class LinksRepository extends RestService {
  LinksRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> createLinks({required String userId, required List<String> productIds}) {
    return postData(
      Constants.links,
      {
        "pagandoUserId": userId,
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> setProductsToLink({required String linkId, required List<String> productIds}) {
    return postData(
      '${Constants.links}/$linkId',
      {
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> getLastedLink({required String userId}) {
    return getData('${Constants.links}/latest?pagandoUserId=$userId');
  }
}
