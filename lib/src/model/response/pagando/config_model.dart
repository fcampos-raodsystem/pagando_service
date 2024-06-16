import 'package:pagando_service/pagando_service.dart';

/// ConfigModel
class ConfigModel {
  /// ConfigModel constructor
  ConfigModel({required this.message, required this.data});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: json['data'] != null ? DataConfigModel.fromJson(json['data'] as Map<String, dynamic>) : DataConfigModel(),
    );
  }

  /// Message
  final String message;

  /// Data
  final DataConfigModel? data;
}

/// DataConfigModel
class DataConfigModel {
  /// DataConfigModel constructor
  DataConfigModel({this.androidVersion, this.iosVersion});

  /// DataConfigModel fromJson
  DataConfigModel.fromJson(Map<String, dynamic> json) {
    androidVersion = json['androidVersion'] != null ? json['androidVersion'].toString() : '';
    iosVersion = json['iosVersion'] != null ? json['iosVersion'].toString() : '';
    json['language'] != null
        ? language = <Language>[]
        : json['language'].forEach((v) {
            language!.add(Language.fromJson(v as Map<String, dynamic>));
          });
  }

  /// [androidVersion]
  String? androidVersion;

  /// [iosVersion]
  String? iosVersion;

  /// [language]
  List<Language>? language;

  /// [dniTypesList]
  List<DniType>? dniTypesList;
}
