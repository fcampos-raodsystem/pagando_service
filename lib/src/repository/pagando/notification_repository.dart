import 'package:paying_service/service.dart';

class NotificationRepository {
  final RestService _restService;

  NotificationRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getNotifications() {
    final response = _restService.getData(Constants.notifications);
    return response;
  }

  Future<Response<dynamic>> markAsRead({String? id}) {
    final response = _restService.patchData('${Constants.notifications}/$id/read', {});
    return response;
  }

  Future<Response<dynamic>> markAllAsRead() {
    final response = _restService.putData('${Constants.notifications}/read-all', {});
    return response;
  }

  Future<Response<dynamic>> deleteNotification({String? id}) {
    final response = _restService.deleteData('${Constants.notifications}/$id');
    return response;
  }

  Future<Response<dynamic>> deleteAllNotifications() {
    final response = _restService.deleteData(Constants.notifications);
    return response;
  }
}
