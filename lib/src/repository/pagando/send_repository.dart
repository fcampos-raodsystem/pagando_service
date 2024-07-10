import 'package:paying_service/paying_export.dart';

class SendRepository {
  final PagandoService service;

  SendRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> findByPin({required String pin}) async {
    return await service.getData(
      '${Constants.findBy}?userDocument=$pin&documentType=PIN',
    );
  }

  Future<Response<dynamic>> findByPhone({
    required String phone,
    String? operator,
  }) async {
    final type = operator != '' ? operator : '+58';
    return await service.getData(
      '${Constants.findBy}?userDocument=$type$phone&documentType=PHONE',
    );
  }

  Future<Response<dynamic>> findLastUsers() async {
    return await service.getData(
      '${Constants.directories}/find-last-users',
    );
  }

  Future<Response<dynamic>> findByDni({
    required String dni,
    required String dniType,
  }) async {
    final type = dniType != '' ? dniType : 'V';
    return await service.getData(
      '${Constants.findBy}?userDocument=$type-$dni&documentType=DNI',
    );
  }

  Future<Response<dynamic>> findByMail({required String mail}) async {
    return await service.getData(
      '${Constants.findBy}?userDocument=$mail&documentType=EMAIL',
    );
  }

  Future<Response<dynamic>> sendPagando({
    required String idUser,
    required String concept,
    required double amount,
    required String info,
  }) async {
    return await service.postData(Constants.sends, {
      'userId': idUser,
      'amount': amount,
      'concept': info,
    });
  }

  Future<Response<dynamic>> requestPagando({
    required String idUser,
    required String concept,
    required double amount,
  }) async {
    return await service.postData(Constants.requests, {
      'userId': idUser,
      'amount': amount,
      'concept': concept,
    });
  }

  Future<Response<dynamic>> acceptRequest({required String acceptURL}) async {
    return await service.postData(acceptURL, {});
  }

  Future<Response<dynamic>> rejectRequest({required String rejectURL}) async {
    return await service.postData(rejectURL, {});
  }
}
