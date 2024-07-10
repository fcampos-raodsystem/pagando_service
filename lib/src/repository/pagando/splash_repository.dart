import 'package:paying_service/paying_export.dart';

class SplashRepository {
  final PagandoService service;

  SplashRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getConfigData() async {
    return await service.getData(Constants.splash);
  }

  Future<Response<dynamic>> getDniTypes() async {
    return service.getData(Constants.personsDniTypes);
  }

  Future<Response<dynamic>> getUserSessions({required String deviceToken}) async {
    return await service.getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
