import 'package:paying_service/service.dart';

class PersonModel {
  PersonModel({required this.message, required this.data});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      message: json['message'],
      data: DataPersonModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final String message;

  final DataPersonModel data;
}

class DataPersonModel {
  DataPersonModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.dni,
    required this.dniType,
    this.user,
  });

  factory DataPersonModel.fromJson(Map<String, dynamic> json) {
    return DataPersonModel(
      id: json['_id'].toString(),
      firstName: json['firstName'].toString(),
      secondName: json['secondName'].toString(),
      dni: json['dni'].toString(),
      dniType: DniType.fromJson(json['dniType'] as Map<String, dynamic>),
      user: json['user'] ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
    );
  }

  final String id;

  final String firstName;

  final String secondName;

  final String dni;

  final DniType dniType;

  final User? user;
}
