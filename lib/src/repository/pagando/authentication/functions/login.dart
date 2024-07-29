part of '../authentication_repository.dart';

extension PostLogin on AuthenticationRepository {
  PostLoginFuture Login({
    required String phoneOrEmail,
    String? password,
    String? opt,
    required String firebaseToken,
    required String deviceBrand,
    required String deviceOS,
    required String deviceModel,
    required String long,
    required String lat,
  }) async {
    try {
      late Response response;

      if (password != null) {
        response = await service.postData(Constants.authLogin, {
          "phoneOrEmail": phoneOrEmail,
          "password": password,
          "userSession": {
            "firebaseToken": firebaseToken,
            "device": deviceBrand,
            "so": deviceOS,
            "model": deviceModel,
            "long": long,
            "lat": lat,
          }
        });
      } else {
        response = await service.postData(Constants.authLogin, {
          "phoneOrEmail": phoneOrEmail,
          "otpCode": opt,
          "userSession": {
            "firebaseToken": firebaseToken,
            "device": deviceBrand,
            "so": deviceOS,
            "model": deviceModel,
            "long": long,
            "lat": lat,
          },
        });
      }

      return Either.goodRequest(AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) {
        return Either.badRequest(Failure(
          failure: HttpRequestFailure.unauthorized,
          message: "Usuario ya tiene una session activa",
        ));
      }
      if (e.response?.statusCode == 403) {
        return Either.badRequest(Failure(
          failure: HttpRequestFailure.unauthorized,
          message: "Usuario o contraseña incorrectos",
        ));
      }
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