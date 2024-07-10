import 'package:paying_service/paying_export.dart';

class SecurityRepository {
  final PagandoService service;

  SecurityRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getSecurityImages() async {
    final response = await service.getData(Constants.securityImages);
    return response;
  }

  Future<Response<dynamic>> updateSecurityImage({required String imageId}) async {
    final response = await service.patchData(
      Constants.securityImages,
      {
        'securityImageId': imageId,
      },
    );
    return response;
  }
}
