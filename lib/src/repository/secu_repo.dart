import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:pagando_service/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SecuRepo Classs
class SecuRepo {
  /// Constructor con parámetros requeridos
  SecuRepo({required this.apiClient, required this.store});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Dependencia de SharedPreferences
  final SharedPreferences store;

  /// Método que obtiene la lista de imágenes de seguridad
  Future<Response<dynamic>> getSecurityImages() async {
    final response = await apiClient.getData(Constants.securityImages);
    return response;
  }

  /// Método que actualiza la imagen de seguridad de tipo patch
  Future<Response<dynamic>> updateSecurityImage({required String imageId}) async {
    final response = await apiClient.patchData(
      Constants.securityImages,
      {
        'securityImageId': imageId,
      },
    );
    return response;
  }
}
