import 'package:decimal/decimal.dart';

/// [MovementModel] is a class that contains the response of the movements
class MovementModel {
  /// [MovementModel] constructor
  MovementModel({required this.message, required this.data});

  /// [fromJson] is a factory method that converts a json object to a [MovementModel]
  factory MovementModel.fromJson(Map<String, dynamic> json) {
    return MovementModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: (json['data'] as List).map((i) => DataMovement.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  /// [message] is a String
  String message;

  /// [data] is a List<DataMovement>
  List<DataMovement> data;
}

/// [DataMovement] is a class that contains the response of the movements
class DataMovement {
  /// [DataMovement] constructor
  DataMovement({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.transactionRef,
    this.type,
    this.ingressType,
    this.amount,
    this.details,
    required this.isExpanded,
  });

  /// [fromJson] is a factory method that converts a json object to a [DataMovement]
  factory DataMovement.fromJson(Map<String, dynamic> json) {
    return DataMovement(
      id: json['_id'] != null ? json['_id'].toString() : '',
      createdAt: json['createdAt'] != null ? json['createdAt'].toString() : '',
      updatedAt: json['updatedAt'] != null ? json['updatedAt'].toString() : '',
      deletedAt: json['deletedAt'] != null ? json['deletedAt'].toString() : '',
      transactionRef: json['transactionRef'] != null ? json['transactionRef'].toString() : '',
      ingressType: json['ingressType'] != null ? json['ingressType'].toString() : '',
      type: json['type'] != null ? json['type'].toString() : '',
      amount: json['amount'] != null ? Decimal.parse(json['amount'].toString()).toStringAsFixed(2) : '0.00',
      details: json['details'] != null ? DetailsMovement.fromJson(json['details'] as Map<String, dynamic>) : DetailsMovement(),
      isExpanded: false,
    );
  }

  /// [id] is a String
  String? id;

  /// [createdAt] is a String
  String? createdAt;

  /// [updatedAt] is a String
  String? updatedAt;

  /// [deletedAt] is a String
  String? deletedAt;

  /// [transactionRef] is a String
  String? transactionRef;

  /// [type] is a String
  String? type;

  /// [ingressType] is a String
  String? ingressType;

  /// [amount] is a String
  String? amount;

  /// [details] is a DetailsMovement
  DetailsMovement? details;

  /// [isExpanded] is a boolean
  bool isExpanded = false;
}

/// [DetailsMovement] is a class that contains the response of the movements
class DetailsMovement {
  /// [DetailsMovement] constructor
  DetailsMovement({
    this.to,
    this.from,
    this.concept,
    this.status,
    this.rejectUrl,
    this.excessAmount,
    this.vesPayedAmount,
    this.acceptUrl,
    this.convertedAmount,
    this.currency,
    this.chargeNumber,
    this.remainingAmount,
    this.chargeId,
  });

  /// [fromJson] is a factory method that converts a json object to a [DetailsMovement]
  factory DetailsMovement.fromJson(Map<String, dynamic> json) {
    return DetailsMovement(
      to: json['to'] != null ? json['to'].toString() : '',
      from: json['from'] != null ? json['from'].toString() : '',
      concept: json['concept'] != null ? json['concept'].toString() : '',
      status: json['status'] != null ? json['status'].toString() : '',
      excessAmount: json['excessAmount'] != null ? Decimal.parse(json['excessAmount'].toString()).toStringAsFixed(2) : '0.00',
      vesPayedAmount: json['vesPayedAmount'] != null ? Decimal.parse(json['vesPayedAmount'].toString()).toStringAsFixed(2) : '0.00',
      rejectUrl: json['rejectUrl'] != null ? json['rejectUrl'].toString() : '',
      acceptUrl: json['acceptUrl'] != null ? json['acceptUrl'].toString() : '',
      convertedAmount: json['convertedAmount'] != null ? Decimal.parse(json['convertedAmount'].toString()).toStringAsFixed(2) : '0.00',
      currency: json['currency'] != null ? json['currency'].toString() : '',
      chargeNumber: json['chargeNumber'] != null ? json['chargeNumber'].toString() : '',
      remainingAmount: json['remainingAmount'] != null ? Decimal.parse(json['remainingAmount'].toString()).toStringAsFixed(2) : '0.00',
      chargeId: json['chargeId'] != null ? json['chargeId'].toString() : '',
    );
  }

  /// [to] is a String
  String? to;

  /// [from] is a String
  String? from;

  /// [concept] is a String
  String? concept;

  /// [status] is a String
  String? status;

  /// [rejectUrl] is a String
  String? rejectUrl;

  /// [acceptUrl] is a String
  String? acceptUrl;

  /// [chargeId] is a String
  String? chargeId;

  /// [convertedAmount] is a String
  String? convertedAmount;

  /// [currency] is a String
  String? currency;

  /// [remainingAmount] is a String
  String? remainingAmount;

  /// [excessAmount] is a String
  String? excessAmount;

  /// [vesPayedAmount] is a String
  String? vesPayedAmount;

  /// [chargeNumber] is a String
  String? chargeNumber;
}
