import 'package:pagando_service/src/model/body/user.dart';

class UserSessionModel {
  UserSessionModel({required this.message, required this.data});

  factory UserSessionModel.fromJson(Map<String, dynamic> json) {
    return UserSessionModel(
      message: json['message'].toString(),
      data: DataUserSessionModel.fromJson(json['data']),
    );
  }

  String message;
  DataUserSessionModel data;
}

class DataUserSessionModel {
  DataUserSessionModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.firebaseToken,
    required this.device,
    required this.so,
    required this.model,
    required this.long,
    required this.lat,
    required this.deviceId,
    required this.user,
    required this.hasBiometric,
  });

  factory DataUserSessionModel.fromJson(Map<String, dynamic> json) {
    return DataUserSessionModel(
      id: json['_id'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
      deletedAt: json['deletedAt'].toString(),
      firebaseToken: json['firebaseToken'].toString(),
      device: json['device'].toString(),
      so: json['so'].toString(),
      model: json['model'].toString(),
      long: json['long'].toString(),
      lat: json['lat'].toString(),
      deviceId: json['deviceId'].toString(),
      user: User.fromJson(json['user']),
      hasBiometric: json['hasBiometric'],
    );
  }

  String id;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String firebaseToken;
  String device;
  String so;
  String model;
  String long;
  String lat;
  String deviceId;
  User user;
  bool hasBiometric;
}
