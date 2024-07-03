import 'package:paying_service/service.dart';

class BankRepository {
  final RestService restService;

  BankRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getPaymentMethods() {
    return restService.getData(Constants.paymentMethods);
  }

  Future<Response<dynamic>> sendDeposit(String ref, String paymentMethod) {
    return restService.postData(Constants.deposit, {
      'referenceCode': ref,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> getWPaymentMethods() {
    return restService.getData(Constants.wPaymentMethods);
  }

  Future<Response<dynamic>> getLastDeposit() {
    return restService.getData(Constants.lastDeposit);
  }

  Future<Response<dynamic>> sendWithdrawals(String bankCode, String phoneNumber, double amount, String? concept, String paymentMethod) {
    return restService.postData(Constants.withdrawals, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber.replaceFirst('+', ''),
      'amount': amount,
      'concept': concept,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> sendDepositNotification(String vesAmount) {
    return restService.postData(Constants.depositNotification, {'vesAmount': double.parse(vesAmount)});
  }
}
