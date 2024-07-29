part of '../authentication_repository.dart';

extension PostVerifyToken on AuthenticationRepository {
  PostVerifyFuture VerifyToken({required String accessToken, required String refreshToken}) async {
    try {
      final response = await service.postData(
        Constants.verifyToken,
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      );

      return Either.goodRequest(VerifyModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(
        Failure(
          failure: error,
          message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
        ),
      );
    } on SocketException {
      return Either.badRequest(
        Failure(
          failure: HttpRequestFailure.network,
          message: "Error de conexión",
        ),
      );
    } catch (_) {
      return Either.badRequest(
        Failure(
          failure: HttpRequestFailure.local,
          message: "Error local",
        ),
      );
    }
  }
}