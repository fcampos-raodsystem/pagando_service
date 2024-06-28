import 'package:paying_service/paying_service.dart';

class DashboardRepository extends RestService {
  DashboardRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getMovements() {
    return getData(Constants.movements);
  }

  Future<Response<dynamic>> rejectRequest({required String rejectUrl}) {
    return postData(rejectUrl, {});
  }
}
