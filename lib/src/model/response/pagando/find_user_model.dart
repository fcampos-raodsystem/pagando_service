import 'package:paying_service/service';

/// Model for response of find user
class FindUSer {
  /// Constructor for FindUSer
  FindUSer({required this.message, required this.data});

  factory FindUSer.fromJson(Map<String, dynamic> json) {
    return FindUSer(message: json['message'].toString(), data: DataFindUser.fromJson(json['data'] as Map<String, dynamic>));
  }

  /// [message] is a string
  final String message;

  /// [data] is a [DataFindUser]
  final DataFindUser data;
}

/// Model for secure config
class DataFindUser {
  /// Constructor for DataFindUser
  DataFindUser(
      {this.id,
      this.password,
      this.email,
      this.pin,
      this.dni,
      this.phone,
      this.isActive,
      this.verified,
      this.deletedAt,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.secureConfig,
      this.person,
      this.session,
      this.securityImage});

  /// Method to create a DataFindUser from a json
  factory DataFindUser.fromJson(Map<String, dynamic> json) {
    return DataFindUser(
        id: json['_id'] != null ? json['_id'].toString() : '',
        password: json['password'] != null ? json['password'].toString() : '',
        email: json['email'] != null ? json['email'].toString() : '',
        pin: json['pin'] != null ? json['pin'].toString() : '',
        dni: json['dni'] != null ? json['dni'].toString() : '',
        phone: json['phone'] != null ? json['phone'].toString() : '',
        isActive: json['is_active'] != null ? json['is_active'] as bool : false,
        verified: json['verified'] != null ? json['verified'] as bool : false,
        deletedAt: json['deleted_at'] != null ? json['deleted_at'].toString() : '',
        lastLogin: json['last_login'] != null ? json['last_login'].toString() : '',
        createdAt: json['created_at'] != null ? json['created_at'].toString() : '',
        updatedAt: json['updated_at'] != null ? json['updated_at'].toString() : '',
        secureConfig: json['secureConfig'] != null ? SecureConfig.fromJson(json['secureConfig'] as Map<String, dynamic>) : SecureConfig(),
        person: json['secureConfig'] != null ? DataPersonModel.fromJson(json['person'] as Map<String, dynamic>) : null,
        session: json['session'] != null ? Session.fromJson(json['session'] as Map<String, dynamic>) : Session(),
        securityImage: json['securityImage'] != null
            ? SecurityImageData.fromJson(json['securityImage'] as Map<String, dynamic>)
            : SecurityImageData(image: ImageData(url: "")));
  }

  /// [id] is a string
  String? id;

  /// [password] is a string
  String? password;

  /// [email] is a string
  String? email;

  /// [pin] is a string
  String? pin;

  /// [dni] is a string
  String? dni;

  /// [phone] is a string
  String? phone;

  /// [isActive] is a bool
  bool? isActive;

  /// [verified] is a bool
  bool? verified;

  /// [deletedAt] is a string
  String? deletedAt;

  /// [lastLogin] is a string
  String? lastLogin;

  /// [createdAt] is a string
  String? createdAt;

  /// [updatedAt] is a string
  String? updatedAt;

  /// [secureConfig] is a [SecureConfig]
  SecureConfig? secureConfig;

  /// [person] is a [DataPersonModel]
  DataPersonModel? person;

  /// [session] is a [Session]
  Session? session;

  /// [securityImage] is a [SecurityImage]
  SecurityImageData? securityImage;
}
