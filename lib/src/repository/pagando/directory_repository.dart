import 'package:paying_service/paying_export.dart';

class DirectoryRepository {
  final PagandoService service;

  DirectoryRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );
}
