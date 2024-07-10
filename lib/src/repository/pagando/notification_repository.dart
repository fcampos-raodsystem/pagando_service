import 'package:paying_service/paying_export.dart';

class NotificationRepository {
  final PagandoService service;

  NotificationRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getNotifications() async {
    final response = await service.getData(Constants.notifications);
    return response;
  }

  Future<Response<dynamic>> markAsRead({String? id}) async {
    final response = await service.patchData('${Constants.notifications}/$id/read', {});
    return response;
  }

  Future<Response<dynamic>> markAllAsRead() async {
    final response = await service.putData('${Constants.notifications}/read-all', {});
    return response;
  }

  Future<Response<dynamic>> deleteNotification({String? id}) async {
    final response = service.deleteData('${Constants.notifications}/$id');
    return response;
  }

  Future<Response<dynamic>> deleteAllNotifications() async {
    final response = service.deleteData(Constants.notifications);
    return response;
  }
}
