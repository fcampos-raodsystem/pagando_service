import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// [SplashRepo] class
class SplashRepo extends RestService{
  /// [SplashRepo] constructor
  SplashRepo({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  /// [getSplashData] method
  Future<Response<dynamic>> getConfigData() {
    return getData(Constants.splash);
  }

  /// [getDniTypes] method
  Future<Response<dynamic>> getDniTypes() {
    return getData(Constants.personsDniTypes);
  }

  /// [getUserSessions] method
  Future<Response<dynamic>> getUserSessions({required String deviceToken}) {
    return getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
