import 'package:pagando_service/src/model/body/dni_type.dart';

/// CreatePerson Model
class CreatePersonModel {
  /// Constructor with required parameters
  CreatePersonModel({required this.message, required this.data});

  /// CreatePersonModel from Json
  factory CreatePersonModel.fromJson(Map<String, dynamic> json) {
    return CreatePersonModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: json['data'] != null ? DataCreatePersonModel.fromJson(json['data'] as Map<String, dynamic>) : DataCreatePersonModel(),
    );
  }

  /// [message] property
  String message;

  /// [data] property
  DataCreatePersonModel data;
}

/// DataCreatePersonModel Model
class DataCreatePersonModel {
  /// Constructor with required parameters
  DataCreatePersonModel({
    this.firstName,
    this.secondName,
    this.dni,
    this.dniTypePrefix,
    this.dniType,
    this.id,
  });

  /// DataCreatePersonModel from Json
  factory DataCreatePersonModel.fromJson(Map<String, dynamic> json) {
    return DataCreatePersonModel(
      firstName: json['firstName'] != null ? json['firstName'].toString() : '',
      secondName: json['secondName'] != null ? json['secondName'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      dniTypePrefix: json['dniTypePrefix'] != null ? json['dniTypePrefix'].toString() : '',
      dniType: json['dniType'] != null ? DniType.fromJson(json['dniType'] as Map<String, dynamic>) : DniType(),
      id: json['_id'] != null ? json['_id'].toString() : '',
    );
  }

  /// [id] property
  String? id;

  /// [firstName] property
  String? firstName;

  /// [secondName] property
  String? secondName;

  /// [dni] property
  String? dni;

  /// [dniTypePrefix] property
  String? dniTypePrefix;

  /// [dniType] property
  DniType? dniType;
}
