part of '../authentication_repository.dart';

extension PostPersons on AuthenticationRepository {
  PostPersonsFuture FetchPersons({required String dni, required String dniType}) async {
    try {
      final response = await service.postData(
        Constants.persons,
        {
          'dni': dni,
          'dniTypePrefix': dniType,
        },
      );

      return Either.goodRequest(PersonModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(PostPersonFailure(
        failure: error,
        message: e.response?.data.toString(),
      ));
    } on SocketException {
      return Either.badRequest(PostPersonFailure(
        failure: HttpRequestFailure.network,
        message: "Error de conexión",
      ));
    } catch (_) {
      return Either.badRequest(PostPersonFailure(
        failure: HttpRequestFailure.local,
        message: "Error local",
      ));
    }
  }
}
