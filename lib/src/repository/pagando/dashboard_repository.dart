import 'package:pagando_service/pagando_service.dart';

class DashRepo extends RestService {
  DashRepo({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getMovements() {
    return getData(Constants.movements);
  }
}
