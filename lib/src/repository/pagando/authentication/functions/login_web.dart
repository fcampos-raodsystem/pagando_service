part of '../authentication_repository.dart';

extension PostLoginWeb on AuthenticationRepository {
  PostLoginFuture LoginWeb({required String phoneOrEmail, String? password, String? opt}) async {
    try {
      final response = await service.postData(
        Constants.authLogin,
        {
          'phoneOrEmail': phoneOrEmail,
          'password': password,
          'opt': opt,
        },
      );
      return Either.goodRequest(AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) error = HttpRequestFailure.unauthorized;
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