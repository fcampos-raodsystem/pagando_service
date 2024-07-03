import 'package:paying_service/service.dart';

class DashboardRepository {
  final RestService restService;

  DashboardRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getMovements() {
    return restService.getData(Constants.movements);
  }

  Future<Response<dynamic>> rejectRequest({required String rejectUrl}) {
    return restService.postData(rejectUrl, {});
  }
}
