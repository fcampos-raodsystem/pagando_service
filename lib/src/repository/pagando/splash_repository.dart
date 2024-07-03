import 'package:paying_service/service.dart';

class SplashRepository {
  final RestService _restService;

  SplashRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getConfigData() {
    return _restService.getData(Constants.splash);
  }

  Future<Response<dynamic>> getDniTypes() {
    return _restService.getData(Constants.personsDniTypes);
  }

  Future<Response<dynamic>> getUserSessions({required String deviceToken}) {
    return _restService.getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
