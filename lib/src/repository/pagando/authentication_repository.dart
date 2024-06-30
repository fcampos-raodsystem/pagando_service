import 'package:paying_service/service.dart';

abstract class AuthenticationRepositoryImplement {
  Future<UserSessions> getUserSession(String firebaseToken);
}

class AuthenticationRepository extends RestService implements AuthenticationRepositoryImplement {
  AuthenticationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  @override
  Future<UserSessions> getUserSession(String firebaseToken) async {
    try {
      final response = await getData(
        '${Constants.userSessions}?fbt=$firebaseToken',
      );

      return GetSessionSuccess(userSessionModel: UserSessionModel.fromJson(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return GetSessionError(failure: HttpRequestFailure.notFound);
    } on SocketException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return GetSessionError(failure: HttpRequestFailure.network);
    } catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return GetSessionError(failure: HttpRequestFailure.local);
    }
  }
}
