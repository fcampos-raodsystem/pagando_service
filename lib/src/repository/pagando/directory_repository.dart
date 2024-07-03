import 'package:paying_service/service.dart';

class DirectoryRepository {
  final RestService _restService;

  DirectoryRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
}
