import 'package:paying_service/paying_export.dart';

class DashboardRepository {
  final PagandoService service;

  DashboardRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getMovements() {
    return service.getData(Constants.movements);
  }

  Future<Response<dynamic>> rejectRequest({required String rejectUrl}) {
    return service.postData(rejectUrl, {});
  }
}
