import 'package:paying_service/service.dart';

abstract class UserSessions {}

class PostSessionSuccess extends UserSessions {
  PostSessionSuccess({
    required this.userSessionModel,
  });

  final UserSessionModel userSessionModel;
}

class PostSessionError extends UserSessions {
  PostSessionError({
    required this.failure,
  });

  final HttpRequestFailure failure;
}
