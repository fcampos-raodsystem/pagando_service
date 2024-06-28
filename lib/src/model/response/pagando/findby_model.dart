import 'package:paying_service/service';

/// FindByModel class
class FindByModel {
  /// FindByModel constructor
  FindByModel({required this.message, this.data});

  factory FindByModel.fromJson(Map<String, dynamic> json) {
    return FindByModel(
      message: json['message'].toString(),
      data: json['data'] != null ? DataFindByModel.fromJson(json['data'] as Map<String, dynamic>) : DataFindByModel(),
    );
  }

  /// [message] variable
  final String message;

  /// [data] variable
  final DataFindByModel? data;
}

/// FindByModel class
class DataFindByModel {
  /// DataFindByModel constructor
  DataFindByModel({this.id, this.pin, this.person, this.profile});

  /// DataFindByModel.fromJson constructor
  factory DataFindByModel.fromJson(Map<String, dynamic> json) {
    return DataFindByModel(
      id: json['_id'] != null ? json['_id'].toString() : null,
      pin: json['pin'] != null ? json['pin'].toString() : null,
      person: json['person'] != null ? Person.fromJson(json['person'] as Map<String, dynamic>) : Person(),
      profile: json['profile'] != null ? json['profile'] : null,
    );
  }

  /// [id] variable
  final String? id;

  /// [pin] variable
  final String? pin;

  /// [person] variable
  final Person? person;

  /// [profile] variable
  final dynamic profile;
}
