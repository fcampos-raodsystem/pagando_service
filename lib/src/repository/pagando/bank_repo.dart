import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// {@template bank_repo}
/// Repository for bank
/// {@endtemplate}
class BankRepo {

  /// {@macro bank_repo}
  /// {@macro api_client}
  /// {@macro shared_preferences}
  BankRepo({required this.apiClient});
  
  /// {@macro bank_repo}
  final RestService apiClient;

  /// Get payment methods
  Future<Response<dynamic>> getPaymentMethods()  {
    return apiClient.getData(Constants.paymentMethods);
  }

  /// Send deposit
  Future<Response<dynamic>> sendDeposit(String ref, String paymentMethod)  {
    return apiClient.postData(Constants.deposit, {
      'referenceCode': ref,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  /// Get last deposit
  Future<Response<dynamic>> getWPaymentMethods()  {
    return  apiClient.getData(Constants.wPaymentMethods);
  }

  /// Get last deposit
  Future<Response<dynamic>> getLastDeposit()  {
    return  apiClient.getData(Constants.lastDeposit);
  }

  /// Send withdrawals
  Future<Response<dynamic>> sendWithdrawals(String bankCode, String phoneNumber, double amount, String? concept, String paymentMethod)  {
    return  apiClient.postData(Constants.withdrawals, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber.replaceFirst('+', ''),
      'amount': amount,
      'concept': concept,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  /// Send deposit notification
  Future<Response<dynamic>> sendDepositNotification(String vesAmount)  {
    return  apiClient.postData(Constants.depositNotification, {'vesAmount': double.parse(vesAmount)});
  }
}