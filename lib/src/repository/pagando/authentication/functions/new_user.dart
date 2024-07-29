part of '../authentication_repository.dart';

extension PostNewUser on AuthenticationRepository {
  PostNewUserFuture NewUser({
    required String phoneOrEmail,
    String? personId,
    String? businessId,
  }) async {
    try {
      if (personId != null) {
        await service.postData(Constants.newUser, {
          'phoneOrEmail': phoneOrEmail,
          'personId': personId,
        });
        return Either.goodRequest(true);
      }

      await service.postData(Constants.newUser, {
        'phoneOrEmail': phoneOrEmail,
        'businessId': businessId,
      });

      return Either.goodRequest(true);
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: "Error de conexión",
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: "Error local",
      ));
    }
  }
}