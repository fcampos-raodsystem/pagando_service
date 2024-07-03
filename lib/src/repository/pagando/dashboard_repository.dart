import 'package:paying_service/service.dart';

class DashboardRepository {
  final RestService _restService;

  DashboardRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getMovements() {
    return _restService.getData(Constants.movements);
  }

  Future<Response<dynamic>> rejectRequest({required String rejectUrl}) {
    return _restService.postData(rejectUrl, {});
  }
}
