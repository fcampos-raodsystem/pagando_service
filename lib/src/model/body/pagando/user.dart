import 'package:paying_service/service.dart';

class User {
  User({this.id, this.password, this.email, this.pin, this.phone, this.deletedAt, this.secureConfig, this.person, this.profile, this.securityImage});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] != null ? json['_id'].toString() : '',
      password: json['password'] != null ? json['password'].toString() : '',
      email: json['email'] != null ? json['email'].toString() : '',
      pin: json['pin'] != null ? json['pin'].toString() : '',
      phone: json['phone'] != null ? json['phone'].toString() : '',
      deletedAt: json['deletedAt'] != null ? json['deletedAt'].toString() : '',
      secureConfig: json['secureConfig'] != null ? SecureConfig.fromJson(json['secureConfig']) : SecureConfig(),
      person: json['person'] != null ? Person.fromJson(json['person']) : Person(),
      securityImage: json['securityImage'] != null ? SecurityImageData.fromJson(json['securityImage']) : SecurityImageData(image: ImageData(url: '')),
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : Profile(id: '', securityKey: '', profileImage: ProfileImage(url: '')),
    );
  }

  /// User id
  final String? id;

  /// User password
  final String? password;

  /// User email
  final String? email;

  /// User pin
  final String? pin;

  /// User phone
  final String? phone;

  /// User deletedAt
  final String? deletedAt;

  /// User secureConfig
  final SecureConfig? secureConfig;

  /// User person
  final Person? person;

  /// Profile profile
  final Profile? profile;

  final SecurityImageData? securityImage;
}
