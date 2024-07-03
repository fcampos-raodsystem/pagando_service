import 'package:paying_service/service.dart';

class AuthenticationRepository implements AuthenticationRepositoryImplement {
  final RestService _restService;

  AuthenticationRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : _restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  @override
  PostUserSessionsFuture postUserSession({required String firebaseToken}) async {
    try {
      final response = await _restService.getData(
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

  @override
  PostLogoutFuture postLogout({required String accessToken, required String refreshToken}) async {
    try {
      await _restService.postData(
        Constants.authLogout,
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      );

      return Either.goodRequest(true);
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response?.data,
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
  PostResfreshFuture postRefreshToken({required String refreshToken}) async {
    try {
      final response = await _restService.postData(
        Constants.refreshToken,
        {
          'refreshToken': refreshToken,
        },
      );

      return Either.goodRequest(AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;
      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(
        Failure(
          failure: error,
          message: jsonEncode(e.response?.data),
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
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: "Error local",
      ));
    }
  }

  @override
  PostVerifyFuture postVerifyToken({required String accessToken, required String refreshToken}) async {
    try {
      final response = await _restService.postData(
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
          message: jsonEncode(e.response?.data),
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

  @override
  PostPersonsFuture postPersons({required String dni, required String dniType}) async {
    try {
      final response = await _restService.postData(
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

  @override
  PostLoginFuture postLoginWeb({required String phoneOrEmail, String? password, String? opt}) async {
    try {
      final response = await _restService.postData(
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
        message: e.response?.data,
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

  @override
  PostLoginFuture postLogin({
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
        response = await _restService.postData(Constants.authLogin, {
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
        response = await _restService.postData(Constants.authLogin, {
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
        message: e.response != null ? jsonEncode(e.response!.data) : "",
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

  @override
  GetMeFuture getMe() async {
    try {
      final response = await _restService.getData(
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
