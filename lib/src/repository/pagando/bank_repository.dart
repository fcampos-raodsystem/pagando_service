import 'package:paying_service/paying_export.dart';

class BankRepository {
  final PagandoService service;

  BankRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getPaymentMethods() {
    return service.getData(Constants.paymentMethods);
  }

  Future<Response<dynamic>> sendDeposit(String ref, String paymentMethod) {
    return service.postData(Constants.deposit, {
      'referenceCode': ref,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> getWPaymentMethods() {
    return service.getData(Constants.wPaymentMethods);
  }

  Future<Response<dynamic>> getLastDeposit() {
    return service.getData(Constants.lastDeposit);
  }

  Future<Response<dynamic>> sendWithdrawals(String bankCode, String phoneNumber, double amount, String? concept, String paymentMethod) {
    return service.postData(Constants.withdrawals, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber.replaceFirst('+', ''),
      'amount': amount,
      'concept': concept,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> sendDepositNotification(String vesAmount, String paymentMethodId) {
    return service.postData(Constants.depositNotification, {
      'vesAmount': vesAmount, 
      'paymentMethodDetailId': paymentMethodId
      });
  }
}
