part of '../authentication_repository.dart';

extension PatchBiometric on AuthenticationRepository {
  PatchBiometricFuture pBiometric({required bool biometric}) async {
    try {
      await service.patchData(
        Constants.setBiometric,
        {
          'hasBiometric': biometric,
        },
      );

      return Either.goodRequest(true);
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;

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