import 'package:paying_service/service.dart';

class NotificationRepository {
  final RestService restService;

  NotificationRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> getNotifications() {
    final response = restService.getData(Constants.notifications);
    return response;
  }

  Future<Response<dynamic>> markAsRead({String? id}) {
    final response = restService.patchData('${Constants.notifications}/$id/read', {});
    return response;
  }

  Future<Response<dynamic>> markAllAsRead() {
    final response = restService.putData('${Constants.notifications}/read-all', {});
    return response;
  }

  Future<Response<dynamic>> deleteNotification({String? id}) {
    final response = restService.deleteData('${Constants.notifications}/$id');
    return response;
  }

  Future<Response<dynamic>> deleteAllNotifications() {
    final response = restService.deleteData(Constants.notifications);
    return response;
  }
}
