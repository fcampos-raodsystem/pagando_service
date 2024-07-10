import 'package:paying_service/paying_export.dart';

typedef PostUserSessionFuture = Future<Either<PostSessionError, PostSessionSuccess>>;

abstract class UserSessionImplement {
  PostUserSessionFuture postUserSession({required String firebaseToken});
}
