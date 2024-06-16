// WithdrawModel model
class WithdrawModel {
  /// Constructor for WithdrawModel
  WithdrawModel({required this.message, required this.data});

  factory WithdrawModel.fromJson(Map<String, dynamic> json) {
    return WithdrawModel(
      message: json['message'].toString(),
      data: WithdrawData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// [message] is a String
  String message;

  /// [data] is a WithdrawData
  WithdrawData data;
}

/// WithdrawData model
class WithdrawData {
  /// Constructor for WithdrawData
  WithdrawData({
    this.convertedAmount,
    this.amount,
    this.bankCode,
    this.phoneNumber,
    this.concept,
    this.reference,
    this.dni,
    this.id,
  });

  /// Factory for WithdrawData
  factory WithdrawData.fromJson(Map<String, dynamic> json) {
    return WithdrawData(
      convertedAmount: json['convertedAmount'] != null ? json['convertedAmount'].toString() : '',
      amount: json['amount'] != null ? json['amount'].toString() : '',
      bankCode: json['bankCode'] != null ? json['bankCode'].toString() : '',
      phoneNumber: json['phoneNumber'] != null ? json['phoneNumber'].toString() : '',
      concept: json['concept'] != null ? json['concept'].toString() : '',
      reference: json['reference'] != null ? json['reference'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      id: json['_id'] != null ? json['_id'].toString() : '',
    );
  }

  /// [convertedAmount] is a String
  String? convertedAmount;

  /// [amount] is a String
  String? amount;

  /// [bankCode] is a String
  String? bankCode;

  /// [phoneNumber] is a String
  String? phoneNumber;

  /// [concept] is a String
  String? concept;

  /// [reference] is a String
  String? reference;

  /// [dni] is a String
  String? dni;

  /// [id] is a String
  String? id;
}
