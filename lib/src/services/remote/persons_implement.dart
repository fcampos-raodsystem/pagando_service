import 'package:paying_service/paying_export.dart';

typedef PostPersonsFuture = Future<Either<PostPersonFailure, PersonModel>>;

abstract class PersonsImplement {
  PostPersonsFuture postPerson({required String dni, required String dniType});
}
