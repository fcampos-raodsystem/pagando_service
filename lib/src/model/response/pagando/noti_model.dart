/// [NotiModel] is a model class that contains the data of the notifications.
class NotiModel {
  /// Constructor for the [NotiModel] class.
  NotiModel({required this.data, required this.message});

  /// Factory method to create a [NotiModel] instance from a json object.
  factory NotiModel.fromJson(Map<String, dynamic> json) {
    return NotiModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: (json['data'] as List).map((i) => NotiData.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  /// [message] is a message that is returned from the server.
  final String message;

  /// [data] is a list of [NotiData] objects.
  final List<NotiData> data;
}

/// [NotiData] is a model class that contains the data of a notification.
class NotiData {
  /// Constructor for the [NotiData] class.
  NotiData({
    this.id,
    this.createdAt,
    this.description,
    this.notificationType,
    this.read,
  });

  factory NotiData.fromJson(Map<String, dynamic> json) {
    return NotiData(
      id: json['_id'] != null ? json['_id'].toString() : '',
      createdAt: json['createdAt'] != null ? json['createdAt'].toString() : '',
      description: json['description'] != null ? json['description'].toString() : '',
      notificationType: json['notifitacionType'] != null ? json['notifitacionType'].toString() : '',
      read: json['read'] != null ? json['read'] as bool : false,
    );
  }

  /// [id] is the id of the notification.
  final String? id;

  /// [createdAt] is the date and time when the notification was created.
  final String? createdAt;

  /// [description] is the description of the notification.
  final String? description;

  /// [notificationType] is the type of the notification.
  final String? notificationType;

  /// [read] is a boolean value that indicates if the notification has been read.
  final bool?
  read;
}
