import 'package:paying_service/paying_export.dart';

abstract class Persons {}

class PostPersonFailure extends Persons {
  PostPersonFailure({required this.failure, this.message});
  final HttpRequestFailure failure;
  final String? message;
}
