import 'package:paying_service/service.dart';

abstract class GeneralResult {}

class Failure extends GeneralResult {
  final String message;
  final HttpRequestFailure failure;

  Failure({required this.message, required this.failure});
}

