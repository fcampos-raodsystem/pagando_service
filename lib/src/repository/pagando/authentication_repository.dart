import 'package:paying_service/service.dart';

abstract class AuthenticationRepositoryImplement {
  Future<UserSessions> getUserSession(String firebaseToken);
}

class AuthenticationRepository extends RestService implements AuthenticationRepositoryImplement {
  AuthenticationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  @override
  Future<UserSessions> getUserSession(String firebaseToken) async {
    final response = await getData(
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
