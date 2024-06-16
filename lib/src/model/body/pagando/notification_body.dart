enum NotificationType {
  message,
  order,
  general,
}

class NotificationBody {
  NotificationType? notificationType;
  int? orderId;
  int? adminId;
  int? deliverymanId;
  int? restaurantId;
  String? type;
  int? conversationId;
  int? index;
  String? image;
  String? name;
  String? receiverType;

  NotificationBody({
    this.notificationType,
    this.orderId,
    this.adminId,
    this.deliverymanId,
    this.restaurantId,
    this.type,
    this.conversationId,
    this.index,
    this.image,
    this.name,
    this.receiverType,
  });

  NotificationBody.fromJson(Map<String, dynamic> json) {
    notificationType = json['order_notification'] != null ? convertToEnum(json['order_notification'].toString()) : NotificationType.message;
    orderId = (json['order_id'] != null ? json['order_id'].toString() : 0) as int?;
    adminId = (json['admin_id'] != null ? json['admin_id'] : 0) as int?;
    deliverymanId = (json['deliveryman_id'] != null ? json['deliveryman_id'] : 0) as int?;
    restaurantId = (json['restaurant_id'] != null ? json['restaurant_id'] : 0) as int?;
    type = json['type'] != null ? json['type'].toString() : '';
    conversationId = (json['conversation_id'] != null ? json['conversation_id'] : 0) as int?;
    index = (json['index'] != null ? json['index'] : 0) as int?;
    image = json['image'] != null ? json['image'].toString() : '';
    name = json['name'] != null ? json['name'].toString() : '';
    receiverType = json['receiver_type'] != null ? json['receiver_type'].toString() : '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_notification'] = notificationType.toString();
    data['order_id'] = orderId;
    data['admin_id'] = adminId;
    data['deliveryman_id'] = deliverymanId;
    data['restaurant_id'] = restaurantId;
    data['type'] = type;
    data['conversation_id'] = conversationId;
    data['index'] = index;
    data['image'] = image;
    data['name'] = name;
    data['receiver_type'] = receiverType;
    return data;
  }

  /// Convert the enum to string
  NotificationType convertToEnum(String? enumString) {
    if (enumString == NotificationType.general.toString()) {
      return NotificationType.general;
    } else if (enumString == NotificationType.order.toString()) {
      return NotificationType.order;
    } else if (enumString == NotificationType.message.toString()) {
      return NotificationType.message;
    }
    return NotificationType.general;
  }
}
