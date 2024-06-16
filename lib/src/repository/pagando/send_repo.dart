import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// Clase que contiene los métodos para enviar y recibir dinero
class SendRepo {
  /// Constructor con parámetros requeridos
  SendRepo({required this.apiClient});

  /// Constructor de la clase
  final RestService apiClient;

  /// Método para obtener el usuario actual
  Future<Response<dynamic>> findByPin({required String pin}) {
    return apiClient.getData(
      '${Constants.findBy}?userDocument=$pin&documentType=PIN',
    );
  }

  Future<Response<dynamic>> findByPhone({
    required String phone,
    String? operator,
  }) {
    final type = operator != '' ? operator : '+58';
    return apiClient.getData(
      '${Constants.findBy}?userDocument=$type$phone&documentType=PHONE',
    );
  }

  Future<Response<dynamic>> findLastUsers() {
    return apiClient.getData(
      '${Constants.directories}/find-last-users',
    );
  }

  Future<Response<dynamic>> findByDni({
    required String dni,
    required String dniType,
  }) {
    final type = dniType != '' ? dniType : 'V';
    return apiClient.getData(
      '${Constants.findBy}?userDocument=$type-$dni&documentType=DNI',
    );
  }

  Future<Response<dynamic>> findByMail({required String mail}) {
    return apiClient.getData(
      '${Constants.findBy}?userDocument=$mail&documentType=EMAIL',
    );
  }

  /// Método para enviar dinero
  Future<Response<dynamic>> sendPagando({
    required String idUser,
    required String concept,
    required double amount,
    required String info,
  }) {
    return apiClient.postData(Constants.sends, {
      'userId': idUser,
      'amount': amount,
      'concept': info,
    });
  }

  /// Método para solicitar dinero
  Future<Response<dynamic>> requestPagando({
    required String idUser,
    required String concept,
    required double amount,
  }) {
    return apiClient.postData(Constants.requests, {
      'userId': idUser,
      'amount': amount,
      'concept': concept,
    });
  }

  /// Método para aceptar una solicitud de dinero
  Future<Response<dynamic>> acceptRequest({required String acceptURL}) {
    return apiClient.postData(acceptURL, {});
  }

  /// Método para rechazar una solicitud de dinero
  Future<Response<dynamic>> rejectRequest({required String rejectURL}) {
    return apiClient.postData(rejectURL, {});
  }
}
