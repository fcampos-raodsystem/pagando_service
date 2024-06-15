import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:pagando_service/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A class that represents the charge repository
class ChargeRepo {
  /// Constructor
  ChargeRepo({required this.apiClient, required this.store});

  /// The api client
  final RestService apiClient;
  /// The shared preferences
  final SharedPreferences store;

  /// Get the list of charges
  Future<Response<dynamic>> postCharges({
    required String phoneOrEmail,
    required double vesAmount,
    required double vesTip,
    required String concept,
  })  {
    return apiClient.postData(Constants.charges, {
      'reciverPoneNumber': phoneOrEmail,
      'vesAmount': vesAmount,
      'vesTip': vesTip,
      'concept': concept,
    });
  }

  /// Get the list of charges
  Future<Response<dynamic>> postResentChargeNotification({required String idCharge})  {
    return apiClient.postData(
      '${Constants.charges}/$idCharge/resend-notifications',
      {'notificationType': 'WHATSAPP'},
    );
  }

  /// Get the list of charges
  Future<Response<dynamic>> pacthValidateCharge({
    required String idCharge,
    required String referenceCode,
  })  {
    return apiClient.patchData('${Constants.charges}/$idCharge/validate-payments', {
      'referenceCode': referenceCode,
    });
  }

  /// Get the list of charges
  Future<Response<dynamic>> patchRejectCharge({required String idCharge})  {
    return apiClient.patchData('${Constants.charges}/$idCharge/reject', {});
  }

  /// Get the list of charges
  Future<Response<dynamic>> postCashBacks({
    required String bankCode,
    required String phoneNumber,
    required double amount,
    required String dni,
    required String dniPrefix,
    String? concept,
  })  {
    return apiClient.postData(Constants.cashBacks, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'concept': concept!,
      'dni': dni,
      'dniPrefix': dniPrefix,
    });
  }

  /// Get the list of charges
  Future<Response<dynamic>> rejectCharge({required String rejectURL})  {
    return apiClient.patchData(rejectURL, {});
  }

  /// Get the list of charges
  Future<Response<dynamic>> payChargeByReference({
    required String id,
    required String reference,
  })  {
    return apiClient.patchData('/charges/$id/validate-payments', {
      'referenceCode': reference,
    });
  }

  /// Get the list of charges
  Future<Response<dynamic>> readjustCharge({required String id})  {
    return apiClient.patchData('/charges/$id/readjusted', {});
  }
}
