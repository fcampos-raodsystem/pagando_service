import 'package:pagando_service/pagando_service.dart';
import 'package:get/get.dart';

class LinksRepo {
  LinksRepo({required this.apiClient});

  final RestService apiClient;

  Future<Response<dynamic>> createLinks({required String userId, required List<String> productIds}) {
    return apiClient.postData(
      Constants.links,
      {
        "pagandoUserId": userId,
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> setProductsToLink({required String linkId, required List<String> productIds}) {
    return apiClient.postData(
      '${Constants.links}/$linkId',
      {
        "productIds": productIds,
      },
    );
  }

  Future<Response<dynamic>> getLastedLink({required String userId}) {
    return apiClient.getData('${Constants.links}/latest?pagandoUserId=$userId');
  }
}
