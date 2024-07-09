import 'package:paying_service/service.dart';

class LinksRepository implements LinkImplement {
  final RestService restService;

  LinksRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  GetLastedLinkFuture getLastedLink({required String userId}) async {
    try {
      final response = await restService.getData('${Constants.links}?pagandoUserId=$userId');

      return Either.goodRequest(LinkLastedModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: 'Error de conexión',
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: 'Error local',
      ));
    }
  }

  @override
  PostCreateLinkFuture postCreateLink({required String userId}) async {
    try {
      final response = await restService.postData(
        Constants.links,
        {"pagandoUserId": userId},
      );

      return Either.goodRequest(LinkLastedModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: 'Error de conexión',
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: 'Error local',
      ));
    }
  }
}
