import 'package:pagando_service/pagando_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DirRepo {
  /// Constructor con parámetros requeridos
  DirRepo({required this.apiClient, required this.store});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Dependencia de SharedPreferences
  final SharedPreferences store;
}
