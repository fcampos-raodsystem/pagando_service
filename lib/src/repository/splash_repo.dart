import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:pagando_service/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [SplashRepo] class
class SplashRepo {
  /// [SplashRepo] constructor
  SplashRepo({required this.store, required this.apiClient});

  /// [apiClient] instance of [RestService]
  final RestService apiClient;

  /// [sharedPreferences] instance of [SharedPreferences]
  final SharedPreferences store;

  /// [getSplashData] method
  Future<Response<dynamic>> getConfigData()  {
    return apiClient.getData(Constants.splash);
  }

  /// [getDniTypes] method
  Future<Response<dynamic>> getDniTypes()  {
    return apiClient.getData(Constants.personsDniTypes);
  }

  /// [getUserSessions] method
  Future<Response<dynamic>> getUserSessions({required String deviceToken})  {
    return apiClient.getData('${Constants.userSessions}?fbt=$deviceToken');
  }
}
