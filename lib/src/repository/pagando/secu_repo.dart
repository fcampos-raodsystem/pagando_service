import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// SecuRepo Classs
class SecuRepo {
  /// Constructor con parámetros requeridos
  SecuRepo({required this.apiClient});

  /// Dependencia de RestService
  final RestService apiClient;

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
