part of '../authentication_repository.dart';

extension PostUserSession on AuthenticationRepository {
  PostUserSessionFuture UserSession({required String firebaseToken}) async {
    try {
      final response = await service.getData(
        '${Constants.userSessions}?fbt=$firebaseToken',
      );

      return Either.goodRequest(PostSessionSuccess(userSessionModel: UserSessionModel.fromJson(response.data)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return Either.badRequest(PostSessionError(failure: HttpRequestFailure.notFound));
      return Either.badRequest(PostSessionError(failure: HttpRequestFailure.server));
    } on SocketException {
      return Either.badRequest(PostSessionError(failure: HttpRequestFailure.network));
    } catch (_) {
      return Either.badRequest(PostSessionError(failure: HttpRequestFailure.local));
    }
  }
}