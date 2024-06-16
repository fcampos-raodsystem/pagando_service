import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// Clase DashRepo
class DashRepo {
  /// Constructor con parámetros requeridos
  DashRepo({required this.apiClient});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> getMovements()  {
    return  apiClient.getData(Constants.movements);
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> cancelRequest({required String rejectUrl})  {
    return  apiClient.postData(rejectUrl, {});
  }
}
