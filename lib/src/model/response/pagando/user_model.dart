import 'package:paying_service/service';
import 'package:paying_service/src/model/body/pagando/secure_image.dart';

/// UserModel class
class UserModel {
  /// UserModel constructor
  UserModel({required this.message, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataUserModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Message
  final String message;

  /// Data
  final DataUserModel data;
}

/// DataUserModel class
class DataUserModel {
  /// DataUserModel constructor
  DataUserModel({
    this.pin,
    this.dni,
    this.person,
    this.email,
    this.profile,
    this.phone,
    this.id,
    this.isActive,
    this.deletedAt,
    this.securityImage,
    this.session
  });

  /// DataUserModel fromJson
  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      pin: json['pin'] != null ? json['pin'].toString() : '',
      dni: json['dni'] != null ? json['dni'].toString() : '',
      person: json['person'] != null ? Person.fromJson(json['person']) : Person(),
      email: json['email'] != null ? json['email'].toString() : '',
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : Profile(profileImage: ProfileImage(url: '')),
      phone: json['phone'] != null ? json['phone'].toString() : '',
      id: json['_id'] != null ? json['_id'].toString() : "",
      isActive: json['isActive'] != null ? json['isActive'] as bool : false,
      deletedAt: json['deletedAt'] != null ? json['deletedAt'].toString() : '',
      securityImage: json['securityImage'] != null ? SecureImage.fromJson(json['securityImage']) : SecureImage(),
      session: json['session'] != null ? Session.fromJson(json['session']) : Session(),
    );
  }

  /// [pin] attribute
  final String? pin;

  /// [dni] attribute
  final String? dni;

  /// [person] attribute
  final Person? person;

  /// [profile] attribute
  late final Profile? profile;

  /// [email] attribute
  final String? email;

  /// [phone] attribute
  final String? phone;

  /// [id] attribute
  final String? id;

  /// [isActive] attribute
  final bool? isActive;

  /// [deletedAt] attribute
  final String? deletedAt;

  /// [SecureImage] attribute
  final SecureImage? securityImage;

  /// [Session] attribute
  final Session? session;
}
