import 'package:paying_service/service.dart';

typedef PostPersonsFuture = Future<Either<HttpRequestFailure, PersonModel>>;

abstract class PersonsImplement {
  PostPersonsFuture postPerson({required String dni, required String dniType});
}