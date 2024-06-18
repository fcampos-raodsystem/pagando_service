import 'package:pagando_service/pagando_service.dart';

class SecurityRepository extends RestService {
  SecurityRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getSecurityImages() async {
    final response = await getData(Constants.securityImages);
    return response;
  }

  Future<Response<dynamic>> updateSecurityImage({required String imageId}) async {
    final response = await patchData(
      Constants.securityImages,
      {
        'securityImageId': imageId,
      },
    );
    return response;
  }
}
