import 'package:paying_service/service.dart';
import 'package:paying_service/src/model/body/pagando/secure_image.dart';

class UserModel {
  UserModel({required this.message, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataUserModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final String message;

  final DataUserModel data;
}

/// DataUserModel class
class DataUserModel {
  /// DataUserModel constructor
  DataUserModel(
      {this.pin,
      this.dni,
      this.person,
      this.email,
      this.profile,
      this.phone,
      this.id,
      this.isActive,
      this.securityImage,
      this.secureConfig,
      this.session});

  /// DataUserModel fromJson
  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      pin: json['pin'] != null ? json['pin'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      person:
          json['person'] != null ? Person.fromJson(json['person']) : Person(),
      email: json['email'] != null ? json['email'].toString() : '',
      profile: json['profile'] != null
          ? Profile.fromJson(json['profile'])
          : Profile(profileImage: ProfileImage(url: '')),
      phone: json['phone'] != null ? json['phone'].toString() : '',
      id: json['_id'] != null ? json['_id'].toString() : "",
      isActive: json['isActive'] != null ? json['isActive'] as bool : false,
      securityImage: json['securityImage'] != null
          ? SecureImage.fromJson(json['securityImage'])
          : SecureImage(),
      secureConfig: json['secureConfig'] != null
          ? SecureConfig.fromJson(json['secureConfig'])
          : null,
      session: json['session'] != null
          ? Session.fromJson(json['session'])
          : Session(),
    );
  }

  final String? pin;

  final String? dni;

  final Person? person;

  late final Profile? profile;

  final String? email;

  final String? phone;

  final String? id;

  final bool? isActive;

  final SecureImage? securityImage;

  final SecureConfig? secureConfig;

  final Session? session;
}
