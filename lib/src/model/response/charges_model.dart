/// Modelo de respuesta de la API de pagando_service
class ChargesModel {
  /// Constructor con parámetros requeridos
  ChargesModel({required this.message, required this.data});

  /// Método para convertir un JSON en un modelo de respuesta
  factory ChargesModel.fromJson(Map<String, dynamic> json) {
    return ChargesModel(
      message: json['message'] != null ? json['message'].toString() : '',
      data: DataChargesModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Mensaje de la respuesta
  final String message;

  /// Datos de la respuesta
  final DataChargesModel data;

  set id(String id) {}
}

/// Modelo de datos de la respuesta de la API de pagando_service
class DataChargesModel {
  /// Constructor con parámetros requeridos
  DataChargesModel({
    required this.amount,
    required this.vesAmount,
    required this.vesTip,
    required this.concept,
    required this.reciverPoneNumber,
    required this.sender,
    required this.expireTime,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.status,
  });

  /// Método para convertir un JSON en un modelo de datos de respuesta
  factory DataChargesModel.fromJson(Map<String, dynamic> json) {
    return DataChargesModel(
      amount: json['amount'] != null ? json['amount'].toString() : '',
      vesAmount: json['vesAmount'] != null ? json['vesAmount'].toString() : '',
      vesTip: json['vesTip'] != null ? json['vesTip'].toString() : '',
      concept: json['concept'] != null ? json['concept'].toString() : '',
      reciverPoneNumber: json['reciverPoneNumber'] != null ? json['reciverPoneNumber'].toString() : '',
      sender: json['sender'] != null ? Sender.fromJson(json['sender'] as Map<String, dynamic>) : Sender(id: ''),
      expireTime: json['expireTime'] != null ? json['expireTime'].toString() : '',
      id: json['_id'] != null ? json['_id'].toString() : '',
      createdAt: json['createdAt'] != null ? json['createdAt'].toString() : '',
      updatedAt: json['updatedAt'] != null ? json['updatedAt'].toString() : '',
      deletedAt: json['deletedAt'] != null ? json['deletedAt'].toString() : '',
      status: json['status'] != null ? json['status'].toString() : '',
    );
  }

  /// Monto de la transacción
  final String amount;

  /// Monto en bolívares
  final String vesAmount;

  /// Propina en bolívares
  final String vesTip;

  /// Concepto de la transacción
  final String concept;

  /// Número de celular del receptor
  final String reciverPoneNumber;

  /// Datos del emisor
  final Sender sender;

  /// Tiempo de expiración
  final String expireTime;

  /// ID de la transacción
  late final String id;

  /// Fecha de creación
  final String createdAt;

  /// Fecha de actualización
  final String updatedAt;

  /// Fecha de eliminación
  final String? deletedAt;

  /// Estado de la transacción
  final String status;
}

/// Modelo de datos del emisor
class Sender {
  /// Constructor con parámetros requeridos
  Sender({required this.id});

  /// Método para convertir un JSON en un modelo de emisor
  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['_id'] != null ? json['_id'].toString() : '',
    );
  }

  final String id;
}
