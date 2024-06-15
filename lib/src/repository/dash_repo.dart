import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:pagando_service/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Clase DashRepo
class DashRepo {
  /// Constructor con parámetros requeridos
  DashRepo({required this.apiClient, required this.store});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Dependencia de SharedPreferences
  final SharedPreferences store;

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> getMovements()  {
    return  apiClient.getData(Constants.movements);
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> cancelRequest({required String rejectUrl})  {
    return  apiClient.postData(rejectUrl, {});
  }
}
