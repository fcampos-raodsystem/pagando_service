import 'package:pagando_service/src/model/body/dni_type.dart';

/// Clase modelo para la entidad Person
class Person {
  /// Constructor de la clase
  Person({this.id, this.firstName, this.secondName, this.dni, this.dniType, this.birthDate, this.sex});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['_id'] != null ? json['_id'].toString() : '',
      firstName: json['firstName'] != null ? json['firstName'].toString() : '',
      secondName: json['secondName'] != null ? json['secondName'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      sex: json['sex'] != null ? json['sex'].toString() : '0',
      birthDate: json['birthDate'] != null ? json['birthDate'].toString() : '',
      dniType: json['dniType'] != null ? DniType.fromJson(json['dniType'] as Map<String, dynamic>) : DniType(),
    );
  }

  /// ID de la persona
  final String? id;

  /// Primer nombre de la persona
  final String? firstName;

  /// Segundo nombre de la persona
  final String? secondName;

  /// DNI de la persona
  final String? dni;

  /// Tipo de DNI de la persona
  final DniType? dniType;

  final String? birthDate;

  final String? sex;
}
