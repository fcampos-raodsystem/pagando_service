import 'package:paying_service/service.dart';

typedef GetUserSessionsFuture = Future<Either<HttpRequestFailure, UserSessionModel>>;

abstract class UserSessionImplement {
  GetUserSessionsFuture postUserSessions(String firebaseToken);
}