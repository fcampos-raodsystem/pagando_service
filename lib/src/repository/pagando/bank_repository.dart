import 'package:paying_service/service';

class BankRepository extends RestService{

  BankRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});
  
  Future<Response<dynamic>> getPaymentMethods()  {
    return getData(Constants.paymentMethods);
  }

  Future<Response<dynamic>> sendDeposit(String ref, String paymentMethod)  {
    return postData(Constants.deposit, {
      'referenceCode': ref,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> getWPaymentMethods()  {
    return  getData(Constants.wPaymentMethods);
  }

  Future<Response<dynamic>> getLastDeposit()  {
    return  getData(Constants.lastDeposit);
  }

  Future<Response<dynamic>> sendWithdrawals(String bankCode, String phoneNumber, double amount, String? concept, String paymentMethod)  {
    return  postData(Constants.withdrawals, {
      'bankCode': bankCode,
      'phoneNumber': phoneNumber.replaceFirst('+', ''),
      'amount': amount,
      'concept': concept,
      'paymentMethodDetailId': paymentMethod,
    });
  }

  Future<Response<dynamic>> sendDepositNotification(String vesAmount)  {
    return  postData(Constants.depositNotification, {'vesAmount': double.parse(vesAmount)});
  }
}