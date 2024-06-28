import 'package:paying_service/paying_service.dart';

class SplashRepository extends RestService {
  SplashRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getConfigData() {
    return getData(Constants.splash);
  }

  Future<Response<dynamic>> getDniTypes() {
    return getData(Constants.personsDniTypes);
  }

  Future<Response<dynamic>> getUserSessions({required String deviceToken}) {
    return getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
