import 'package:paying_service/service.dart';

class AuthenticationRepository extends RestService implements AuthenticationRepositoryImplement {
  AuthenticationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  @override
  PostUserSessionsFuture postUserSession({required String firebaseToken}) async {
    try {
      final response = await getData(
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
  Future<Authentication> postLogin({
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
      final response = await postData(
        Constants.authLogin,
        {
          'phoneOrEmail': phoneOrEmail,
          'password': password,
          'opt': opt,
          'fbt': firebaseToken,
          'deviceBrand': deviceBrand,
          'deviceOS': deviceOS,
          'deviceModel': deviceModel,
          'long': long,
          'lat': lat,
        },
      );
      return LoginSuccess(authLoginModel: AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return LoginFailure(failure: HttpRequestFailure.notFound, message: e.response?.data);
      if (e.response?.statusCode == 401) return LoginFailure(failure: HttpRequestFailure.unauthorized, message: e.response?.data);
      if (e.response?.statusCode == 400) return LoginFailure(failure: HttpRequestFailure.badRequest, message: e.response?.data);

      return LoginFailure(failure: HttpRequestFailure.server, message: "Server Error");
    } on SocketException {
      return LoginFailure(failure: HttpRequestFailure.network, message: "No Internet Connection");
    } catch (_) {
      return LoginFailure(failure: HttpRequestFailure.local, message: "Local Error");
    }
  }

  @override
  Future<Authentication> postLoginWeb({
    required String phoneOrEmail,
    String? password,
    String? opt,
  }) async {
    try {
      final response = await postData(
        Constants.authLogin,
        {
          'phoneOrEmail': phoneOrEmail,
          'password': password,
          'opt': opt,
        },
      );
      return LoginSuccess(authLoginModel: AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return LoginFailure(failure: HttpRequestFailure.notFound, message: e.response?.data);
      if (e.response?.statusCode == 401) return LoginFailure(failure: HttpRequestFailure.unauthorized, message: e.response?.data);
      if (e.response?.statusCode == 400) return LoginFailure(failure: HttpRequestFailure.badRequest, message: e.response?.data);

      return LoginFailure(failure: HttpRequestFailure.server, message: "Server Error");
    } on SocketException {
      return LoginFailure(failure: HttpRequestFailure.network, message: "No Internet Connection");
    } catch (_) {
      return LoginFailure(failure: HttpRequestFailure.local, message: "Local Error");
    }
  }

  @override
  Future<Authentication> postLogout({required String accessToken, required String refreshToken}) async {
    try {
      await postData(
        Constants.authLogout,
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      );

      return LogoutSuccess(success: true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return LogoutFailure(failure: HttpRequestFailure.notFound);
      if (e.response?.statusCode == 401) return LogoutFailure(failure: HttpRequestFailure.unauthorized);
      if (e.response?.statusCode == 400) return LogoutFailure(failure: HttpRequestFailure.badRequest);

      return LogoutFailure(failure: HttpRequestFailure.server);
    } on SocketException {
      return LoginFailure(failure: HttpRequestFailure.network);
    } catch (_) {
      return LoginFailure(failure: HttpRequestFailure.local);
    }
  }

  @override
  Future<Authentication> postRefreshToken({required String refreshToken}) async {
    try {
      final response = await postData(
        Constants.refreshToken,
        {
          'refreshToken': refreshToken,
        },
      );

      return RefreshTokenSuccess(authLoginModel: AuthLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return RefreshTokenFailure(failure: HttpRequestFailure.notFound);
      if (e.response?.statusCode == 401) return RefreshTokenFailure(failure: HttpRequestFailure.unauthorized);
      if (e.response?.statusCode == 400) return RefreshTokenFailure(failure: HttpRequestFailure.badRequest);

      return RefreshTokenFailure(failure: HttpRequestFailure.server);
    } on SocketException {
      return RefreshTokenFailure(failure: HttpRequestFailure.network);
    } catch (_) {
      return RefreshTokenFailure(failure: HttpRequestFailure.local);
    }
  }

  @override
  Future<Authentication> postVerifyToken({required String accessToken, required String refreshToken}) async {
    try {
      final response = await postData(
        Constants.verifyToken,
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      );

      return VerifyTokenSuccess(verifyModel: VerifyModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return VerifyTokenFailure(failure: HttpRequestFailure.notFound);
      if (e.response?.statusCode == 401) return VerifyTokenFailure(failure: HttpRequestFailure.unauthorized);
      if (e.response?.statusCode == 400) return VerifyTokenFailure(failure: HttpRequestFailure.badRequest);

      return VerifyTokenFailure(failure: HttpRequestFailure.server);
    } on SocketException {
      return VerifyTokenFailure(failure: HttpRequestFailure.network);
    } catch (_) {
      return VerifyTokenFailure(failure: HttpRequestFailure.local);
    }
  }

  @override
  PostPersonsFuture postPersons({required String dni, required String dniType}) async {
    try {
      final response = await postData(
        Constants.persons,
        {
          'dni': dni,
          'dniType': dniType,
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
        message: e.response?.data,
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
