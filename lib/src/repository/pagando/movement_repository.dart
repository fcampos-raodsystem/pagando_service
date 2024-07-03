import 'package:paying_service/service.dart';

class MovementRepository {
  final RestService restService;

  MovementRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
}
