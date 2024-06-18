import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// Clase DashRepo
class DashRepo extends RestService{
  /// Constructor con parámetros requeridos
  DashRepo({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> getMovements()  {
    return  getData(Constants.movements);
  }
}
