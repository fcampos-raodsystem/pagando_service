import 'package:paying_service/service.dart';

typedef PostUserSessionsFuture = Future<Either<PostSessionError, PostSessionSuccess>>;

abstract class UserSessionImplement {
  PostUserSessionsFuture postUserSessions({required String firebaseToken});
}
