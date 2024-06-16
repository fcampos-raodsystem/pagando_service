import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// This file contains the repository class for notifications
class NotiRepo {
  /// Constructor with required parameters
  NotiRepo({required this.apiClient});

  /// Dependency of RestService
  final RestService apiClient;

  /// Method to get all notifications
  Future<Response<dynamic>> getNotifications() {
    final response = apiClient.getData(Constants.notifications);
    return response;
  }

  /// Method to mark a notification as read
  Future<Response<dynamic>> markAsRead({String? id}) {
    final response = apiClient.patchData('${Constants.notifications}/$id/read', {});
    return response;
  }

  /// Method to mark all notifications as read
  Future<Response<dynamic>> markAllAsRead() {
    final response = apiClient.putData('${Constants.notifications}/read-all', {});
    return response;
  }

  /// Method to delete a notification
  Future<Response<dynamic>> deleteNotification({String? id}) {
    final response = apiClient.deleteData('${Constants.notifications}/$id');
    return response;
  }

  /// Method to delete all notifications
  Future<Response<dynamic>> deleteAllNotifications() {
    final response = apiClient.deleteData(Constants.notifications);
    return response;
  }
}
