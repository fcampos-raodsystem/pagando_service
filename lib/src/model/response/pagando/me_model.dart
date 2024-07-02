import 'package:paying_service/service.dart';

/// MeModel is a model class that contains the data of the user.
class MeModel {
  /// Constructor for MeModel.
  MeModel({required this.message, required this.data});

  factory MeModel.fromJson(Map<String, dynamic> json) {
    return MeModel(
        message: json['message'] != null ? json['message'].toString() : '',
        data: json['data'] != null
            ? DataMeModel.fromJson(json['data'] as Map<String, dynamic>)
            : DataMeModel(
                id: '',
                email: '',
                pin: '',
                phone: '',
                verified: false,
                lastLogin: '',
                person: Person(),
                balance: Balance(),
                secureConfig: SecureConfig(),
                profile: Profile(),
                session: Session(),
              ));
  }

  /// [message] is a message from the server.
  final String message;

  /// [data] is the data of the user.
  final DataMeModel data;
}

/// Person is a model class that contains the data of the person.
class DataMeModel {
  /// Constructor for DataMeModel.
  DataMeModel({
    this.id,
    this.email,
    this.pin,
    this.phone,
    this.verified,
    this.lastLogin,
    this.person,
    this.balance,
    this.secureConfig,
    this.profile,
    this.session,
  });

  /// Constructor for DataMeModel from JSON.
  factory DataMeModel.fromJson(Map<String, dynamic> json) {
    return DataMeModel(
      id: json['_id'] != null ? json['_id'].toString() : '',
      email: json['email'] != null ? json['email'].toString() : '',
      pin: json['pin'] != null ? json['pin'].toString() : '',
      phone: json['phone'] != null ? json['phone'].toString() : '',
      verified: json['verified'] != null ? json['verified'] : false,
      lastLogin: json['lastLogin'] != null ? json['lastLogin'] : '',
      person: json['person'] != null ? Person.fromJson(json['person']) : null,
      balance: json['balance'] != null ? Balance.fromJson(json['balance']) : null,
      secureConfig: json['secureConfig'] != null ? SecureConfig.fromJson(json['secureConfig']) : null,
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : null,
      session: json['session'] != null ? Session.fromJson(json['session']) : null,
    );
  }

  final String? id;
  final String? email;
  final String? pin;
  final String? phone;
  final bool? verified;
  final dynamic lastLogin;
  final Person? person;
  final Balance? balance;
  final Profile? profile;
  final SecureConfig? secureConfig;
  final Session? session;
}
