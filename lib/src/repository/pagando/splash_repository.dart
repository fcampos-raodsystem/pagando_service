import 'package:paying_service/service.dart';

class SplashRepository {
  final RestService restService;

  SplashRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getConfigData() {
    return restService.getData(Constants.splash);
  }

  Future<Response<dynamic>> getDniTypes() {
    return restService.getData(Constants.personsDniTypes);
  }

  Future<Response<dynamic>> getUserSessions({required String deviceToken}) {
    return restService.getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
