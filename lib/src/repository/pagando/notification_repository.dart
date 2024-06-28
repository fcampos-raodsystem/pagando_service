import 'package:paying_service/service';

class NotificationRepository extends RestService {
  NotificationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getNotifications() {
    final response = getData(Constants.notifications);
    return response;
  }

  Future<Response<dynamic>> markAsRead({String? id}) {
    final response = patchData('${Constants.notifications}/$id/read', {});
    return response;
  }

  Future<Response<dynamic>> markAllAsRead() {
    final response = putData('${Constants.notifications}/read-all', {});
    return response;
  }

  Future<Response<dynamic>> deleteNotification({String? id}) {
    final response = deleteData('${Constants.notifications}/$id');
    return response;
  }

  Future<Response<dynamic>> deleteAllNotifications() {
    final response = deleteData(Constants.notifications);
    return response;
  }
}
