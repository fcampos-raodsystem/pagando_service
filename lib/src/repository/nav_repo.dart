import 'package:pagando_service/pagando_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavRepo {
  /// Constructor con parámetros requeridos
  NavRepo({required this.apiClient, required this.store});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Dependencia de SharedPreferences
  final SharedPreferences store;
}
