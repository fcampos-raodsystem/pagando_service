import 'package:paying_service/service.dart';

abstract class Persons {}

class PostPersonSuccess extends Persons {
  PostPersonSuccess({required this.personModel});
  final PersonModel personModel;
}

class PostPersonFailure extends Persons {
  PostPersonFailure({required this.httpRequestFailure, this.message});
  final HttpRequestFailure httpRequestFailure;
  final String? message;
}