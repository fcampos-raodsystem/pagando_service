/// SendsModel class
class SendsModel {
  /// SendsModel constructor
  SendsModel({required this.message, required this.data});

  factory SendsModel.fromJson(Map<String, dynamic> json) {
    return SendsModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataSendsModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// [message] variable
  final String message;

  /// [data] variable
  final DataSendsModel data;
}

/// DataSendsModel class
class DataSendsModel {
  /// DataSendsModel constructor
  DataSendsModel({this.available});

  /// DataSendsModel.fromJson factory
  factory DataSendsModel.fromJson(Map<String, dynamic> json) {
    return DataSendsModel(
      available: json['available'].toString(),
    );
  }

  /// [available] variable
  String? available;
}
