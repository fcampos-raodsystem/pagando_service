import 'package:paying_service/paying_service.dart';

/// Model for the response of the person
class PersonModel {
  /// Constructor with required parameters
  PersonModel({required this.message, required this.data});

  /// Factory constructor with required parameters
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataPersonModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// [message] is the message of the response
  final String message;

  /// [data] is the data of the person
  final DataPersonModel data;
}

/// Model for the response of the person
class DataPersonModel {
  /// Constructor with required parameters
  DataPersonModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.dni,
    required this.dniType,
  });

  factory DataPersonModel.fromJson(Map<String, dynamic> json) {
    return DataPersonModel(
      id: json['_id'].toString(),
      firstName: json['firstName'].toString(),
      secondName: json['secondName'].toString(),
      dni: json['dni'].toString(),
      dniType: DniType.fromJson(json['dniType'] as Map<String, dynamic>),
    );
  }

  /// [id] is the id of the person
  final String id;

  /// [firstName] is the first name of the person
  final String firstName;

  /// [secondName] is the second name of the person
  final String secondName;

  /// [dni] is the dni of the person
  final String dni;

  /// [dniType] is the type of the dni of the person
  final DniType dniType;
}
