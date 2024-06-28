import 'package:paying_service/service.dart';

/// A class that represents the response of the login request
class AuthLoginModel {
  /// Constructor
  AuthLoginModel({required this.message, required this.data});

  /// Factory method to create an instance of the class from a JSON
  factory AuthLoginModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginModel(message: json['message'].toString(), data: Tokens.fromJson(json['data']));
  }

  /// The message of the response
  String message;

  /// The data of the response
  Tokens data;
}
