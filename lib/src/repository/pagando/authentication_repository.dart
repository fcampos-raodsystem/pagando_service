import 'package:paying_service/service.dart';

abstract class AuthenticationRepositoryImplement {
  Future<UserSessions> getUserSession(String firebaseToken);
}

class AuthenticationRepository implements AuthenticationRepositoryImplement {
  final RestService _restService;

  AuthenticationRepository({
    required RestService restService,
  }) : _restService = restService;

  @override
  Future<UserSessions> getUserSession(String firebaseToken) async {
    final response = await _restService.getData(
      '${Constants.userSessions}?fbt=$firebaseToken',
    );

    if (response.statusCode != 200 || response.statusCode != 500) {
      return GetSessionError(failure: HttpRequestFailure.notFound);
    }

    if (response.statusCode == 500) {
      return GetSessionError(failure: HttpRequestFailure.server);
    }

    return GetSessionSuccess(userSessionModel: UserSessionModel.fromJson(response.data));
  }
}
