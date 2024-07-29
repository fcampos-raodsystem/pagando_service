import 'package:paying_service/paying_export.dart';

class ChargeRepository {
  final PagandoService service;

  ChargeRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
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
    return service.postData(Constants.charges, {
      'reciverPoneNumber': phoneOrEmail,
      'vesAmount': vesAmount,
      'vesTip': vesTip,
      'concept': concept,
    });
  }

  Future<Response<dynamic>> postResentChargeNotification({required String idCharge}) {
    return service.postData(
      '${Constants.charges}/$idCharge/resend-notifications',
      {'notificationType': 'WHATSAPP'},
    );
  }

  Future<Response<dynamic>> pacthValidateCharge({
    required String idCharge,
    required String referenceCode,
  }) {
    return service.patchData('${Constants.charges}/$idCharge/validate-payments', {
      'referenceCode': referenceCode,
    });
  }

  Future<Response<dynamic>> patchRejectCharge({required String idCharge}) {
    return service.patchData('${Constants.charges}/$idCharge/reject', {});
  }

  Future<Response<dynamic>> postCashBacks({
    required String bankCode,
    required String phoneNumber,
    required double amount,
    required String dni,
    required String dniPrefix,
    String? concept,
  }) {
    return service.postData(Constants.cashBacks, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'concept': concept ?? "",
      'dni': dni,
      'dniPrefix': dniPrefix,
    });
  }

  Future<Response<dynamic>> rejectCharge({required String rejectURL}) {
    return service.patchData(rejectURL, {});
  }

  Future<Response<dynamic>> payChargeByReference({
    required String id,
    required String reference,
  }) {
    return service.patchData('/charges/$id/validate-payments', {
      'referenceCode': reference,
    });
  }

  Future<Response<dynamic>> readjustCharge({required String id}) {
    return service.patchData('/charges/$id/readjusted', {});
  }
}
