import 'package:paying_service/service.dart';

class SecurityRepository {
  final RestService _restService;

  SecurityRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getSecurityImages() async {
    final response = await _restService.getData(Constants.securityImages);
    return response;
  }

  Future<Response<dynamic>> updateSecurityImage({required String imageId}) async {
    final response = await _restService.patchData(
      Constants.securityImages,
      {
        'securityImageId': imageId,
      },
    );
    return response;
  }
}
