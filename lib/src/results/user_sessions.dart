import 'package:paying_service/service.dart';

abstract class UserSessions {}

class GetSessionSuccess extends UserSessions {
  GetSessionSuccess({
    required this.userSessionModel,
  });

  final UserSessionModel userSessionModel;
}

class GetSessionError extends UserSessions {
  GetSessionError({
    required this.failure,
  });

  final HttpRequestFailure failure;
}
