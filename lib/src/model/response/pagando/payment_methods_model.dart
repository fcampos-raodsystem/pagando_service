/// [PaymentMethodsModel] is a model class for the response of the payment methods
class PaymentMethodsModel {
  /// Constructor with required parameters
  PaymentMethodsModel({required this.message, required this.data});

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: (json['data'] as List).map((i) => DataPaymentMethods.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  /// [message] is a message from the server
  final String message;

  /// [data] is a list of [DataPaymentMethods]
  final List<DataPaymentMethods> data;
}

/// [DataPaymentMethods] is a model class for the data of the payment methods
class DataPaymentMethods {
  /// Constructor with required parameters
  DataPaymentMethods({required this.name, required this.paymentMethodDetails, required this.currency});

  /// Factory method to create a [DataPaymentMethods] from a json
  factory DataPaymentMethods.fromJson(Map<String, dynamic> json) {
    return DataPaymentMethods(
      name: json['name'] != null ? json['name'].toString() : '',
      paymentMethodDetails: (json['paymentMethodDetails'] as List).map((i) => PaymentMethodDetails.fromJson(i as Map<String, dynamic>)).toList(),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );
  }

  /// [name] is the name of the payment method
  final String name;

  /// [paymentMethodDetails] is a list of [PaymentMethodDetails]
  final List<PaymentMethodDetails> paymentMethodDetails;

  /// [currency] is a [Currency] object
  final Currency currency;
}

/// [PaymentMethodDetails] is a model class for the details of the payment method
class PaymentMethodDetails {
  /// Constructor with required parameters
  PaymentMethodDetails({required this.details, required this.pagandoPaymentMethod});

  /// Factory method to create a [PaymentMethodDetails] from a json
  factory PaymentMethodDetails.fromJson(Map<String, dynamic> json) {
    return PaymentMethodDetails(
      details: json['details'] != null ? Details.fromJson(json['details'] as Map<String, dynamic>) : Details(bankCode: "", dni: "", phoneNumber: ""),
      pagandoPaymentMethod: PagandoPaymentMethod.fromJson(json['pagandoPaymentMethod'] as Map<String, dynamic>),
    );
  }

  /// [details] is a [Details] object
  final Details details;

  /// [pagandoPaymentMethod] is a [PagandoPaymentMethod] object
  final PagandoPaymentMethod pagandoPaymentMethod;
}

/// [Details] is a model class for the details of the payment method
class Details {
  /// Constructor with required parameters
  Details({required this.bankCode, required this.dni, required this.phoneNumber});

  /// Factory method to create a [Details] from a json
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      bankCode: json['bankCode'] != null ? json['bankCode'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      phoneNumber: json['phoneNumber'] != null ? json['phoneNumber'].toString() : '',
    );
  }

  /// [bankCode] is the bank code
  final String bankCode;

  /// [dni] is the dni
  final String dni;

  /// [phoneNumber] is the phone number
  final String phoneNumber;
}

/// [PagandoPaymentMethod] is a model class for the pagando payment method
class PagandoPaymentMethod {
  /// Constructor with required parameters
  PagandoPaymentMethod({required this.id});

  /// Factory method to create a [PagandoPaymentMethod] from a json
  factory PagandoPaymentMethod.fromJson(Map<String, dynamic> json) {
    return PagandoPaymentMethod(
      id: json['_id'] != null ? json['_id'].toString() : '',
    );
  }

  /// [id] is the id of the pagando payment method
  final String id;
}

/// [Currency] is a model class for the currency
class Currency {
  /// Constructor with required parameters
  Currency({required this.name, required this.latestRate});

  /// Factory method to create a [Currency] from a json
  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] != null ? json['name'].toString() : '',
      latestRate: json['latestRate'] != null ? LatestRate.fromJson(json['latestRate'] as Map<String, dynamic>) : LatestRate(depositRate: "", withdrawRate: ""),
    );
  }

  /// [name] is the name of the currency
  final String name;

  /// [latestRate] is a [LatestRate] object
  final LatestRate latestRate;
}

/// [LatestRate] is a model class for the latest rate
class LatestRate {
  /// Constructor with required parameters
  LatestRate({required this.withdrawRate, required this.depositRate});

  /// Factory method to create a [LatestRate] from a json
  factory LatestRate.fromJson(Map<String, dynamic> json) {
    return LatestRate(
      withdrawRate: json['withdrawRate'] != null ? json['withdrawRate'].toString() : '',
      depositRate: json['depositRate'] != null ? json['depositRate'].toString() : '',
    );
  }

  /// [withdrawRate] is the withdraw rate
  final String withdrawRate;

  /// [depositRate] is the deposit rate
  final String depositRate;
}
