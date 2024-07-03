import 'package:paying_service/service.dart';

class SendRepository {
  final RestService _restService;

  SendRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> findByPin({required String pin}) {
    return _restService.getData(
      '${Constants.findBy}?userDocument=$pin&documentType=PIN',
    );
  }

  Future<Response<dynamic>> findByPhone({
    required String phone,
    String? operator,
  }) {
    final type = operator != '' ? operator : '+58';
    return _restService.getData(
      '${Constants.findBy}?userDocument=$type$phone&documentType=PHONE',
    );
  }

  Future<Response<dynamic>> findLastUsers() {
    return _restService.getData(
      '${Constants.directories}/find-last-users',
    );
  }

  Future<Response<dynamic>> findByDni({
    required String dni,
    required String dniType,
  }) {
    final type = dniType != '' ? dniType : 'V';
    return _restService.getData(
      '${Constants.findBy}?userDocument=$type-$dni&documentType=DNI',
    );
  }

  Future<Response<dynamic>> findByMail({required String mail}) {
    return _restService.getData(
      '${Constants.findBy}?userDocument=$mail&documentType=EMAIL',
    );
  }

  Future<Response<dynamic>> sendPagando({
    required String idUser,
    required String concept,
    required double amount,
    required String info,
  }) {
    return _restService.postData(Constants.sends, {
      'userId': idUser,
      'amount': amount,
      'concept': info,
    });
  }

  Future<Response<dynamic>> requestPagando({
    required String idUser,
    required String concept,
    required double amount,
  }) {
    return _restService.postData(Constants.requests, {
      'userId': idUser,
      'amount': amount,
      'concept': concept,
    });
  }

  Future<Response<dynamic>> acceptRequest({required String acceptURL}) {
    return _restService.postData(acceptURL, {});
  }

  Future<Response<dynamic>> rejectRequest({required String rejectURL}) {
    return _restService.postData(rejectURL, {});
  }
}
