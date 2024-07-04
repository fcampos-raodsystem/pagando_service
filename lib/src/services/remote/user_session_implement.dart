import 'package:paying_service/service.dart';

typedef PostUserSessionFuture = Future<Either<PostSessionError, PostSessionSuccess>>;

abstract class UserSessionImplement {
  PostUserSessionFuture postUserSession({required String firebaseToken});
}
