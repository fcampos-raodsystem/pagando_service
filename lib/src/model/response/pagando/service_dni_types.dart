import 'package:paying_service/service';

class ServiceDniTypes {
  ServiceDniTypes({required this.message, required this.data});

  factory ServiceDniTypes.fromJson(Map<String, dynamic> json) {
    return ServiceDniTypes(
      message: json['message'] != null ? json['message'].toString() : '',
      data: (json['data'] as List).map((i) => DniType.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  final String message;

  final List<DniType> data;
}
