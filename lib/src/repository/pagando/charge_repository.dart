import 'package:paying_service/service.dart';

class ChargeRepository{
  final RestService restService;

  ChargeRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
  

  Future<Response<dynamic>> postCharges({
    required String phoneOrEmail,
    required double vesAmount,
    required double vesTip,
    required String concept,
  }) {
    return restService.postData(Constants.charges, {
      'reciverPoneNumber': phoneOrEmail,
      'vesAmount': vesAmount,
      'vesTip': vesTip,
      'concept': concept,
    });
  }

  Future<Response<dynamic>> postResentChargeNotification({required String idCharge}) {
    return restService.postData(
      '${Constants.charges}/$idCharge/resend-notifications',
      {'notificationType': 'WHATSAPP'},
    );
  }

  Future<Response<dynamic>> pacthValidateCharge({
    required String idCharge,
    required String referenceCode,
  }) {
    return restService.patchData('${Constants.charges}/$idCharge/validate-payments', {
      'referenceCode': referenceCode,
    });
  }

  Future<Response<dynamic>> patchRejectCharge({required String idCharge}) {
    return restService.patchData('${Constants.charges}/$idCharge/reject', {});
  }

  Future<Response<dynamic>> postCashBacks({
    required String bankCode,
    required String phoneNumber,
    required double amount,
    required String dni,
    required String dniPrefix,
    String? concept,
  }) {
    return restService.postData(Constants.cashBacks, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'concept': concept!,
      'dni': dni,
      'dniPrefix': dniPrefix,
    });
  }

  Future<Response<dynamic>> rejectCharge({required String rejectURL}) {
    return restService.patchData(rejectURL, {});
  }

  Future<Response<dynamic>> payChargeByReference({
    required String id,
    required String reference,
  }) {
    return restService.patchData('/charges/$id/validate-payments', {
      'referenceCode': reference,
    });
  }

  Future<Response<dynamic>> readjustCharge({required String id}) {
    return restService.patchData('/charges/$id/readjusted', {});
  }
}
