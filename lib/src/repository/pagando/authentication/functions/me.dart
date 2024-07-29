part of '../authentication_repository.dart';

extension FetchMe on AuthenticationRepository {
  GetMeFuture Me() async {
    try {
      final response = await service.getData(
        Constants.me,
      );

      return Either.goodRequest(MeModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401)
        return Either.badRequest(
          Failure(
            failure: HttpRequestFailure.unauthorized,
            message: 'No autorizado',
          ),
        );
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.server,
        message: jsonEncode(e.response?.data),
      ));
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