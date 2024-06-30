import 'package:paying_service/service.dart';
import 'package:paying_service/src/model/response/pagando/verify_model.dart';

abstract class AuthenticationRepositoryImplement {
  Future<UserSessions> getUserSession(String firebaseToken);
  Future<Authentication> postVerifyToken(String accessToken, String refreshToken);
  Future<Authentication> postRefreshToken(String refreshToken);
  Future<Authentication> postLogout(String refreshToken);
  Future<Authentication> postLoginWeb(String phoneOrEmail, String? password, String? otp);
  Future<Authentication> postLogin(String phoneOrEmail, String? password, String? otp);
}

class AuthenticationRepository extends RestService implements AuthenticationRepositoryImplement {
  AuthenticationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  @override
  Future<UserSessions> getUserSession(String firebaseToken) async {
    try {
      final response = await getData(
        '${Constants.userSessions}?fbt=$firebaseToken',
      );

      return GetSessionSuccess(userSessionModel: UserSessionModel.fromJson(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      if (e.response?.statusCode == 404) return GetSessionError(failure: HttpRequestFailure.notFound);
      return GetSessionError(failure: HttpRequestFailure.server);
    } on SocketException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return GetSessionError(failure: HttpRequestFailure.network);
    } catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return GetSessionError(failure: HttpRequestFailure.local);
    }
  }

  @override
  Future<Authentication> postLogin(String phoneOrEmail, String? password, String? otp) {
    // TODO: implement postLogin
    throw UnimplementedError();
  }

  @override
  Future<Authentication> postLoginWeb(String phoneOrEmail, String? password, String? otp) {
    // TODO: implement postLoginWeb
    throw UnimplementedError();
  }

  @override
  Future<Authentication> postLogout(String refreshToken) {
    // TODO: implement postLogout
    throw UnimplementedError();
  }

  @override
  Future<Authentication> postRefreshToken(String refreshToken) {
    // TODO: implement postRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<Authentication> postVerifyToken(String accessToken, String refreshToken) async {
    try {
      final response = await postData(
        Constants.verifyToken,
        {
          'access_token': accessToken,
          'refresh_token': refreshToken,
        },
      );

      return VerifyTokenSuccess(verifyModel: VerifyModel.fromJson(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      if (e.response?.statusCode == 404) return VerifyTokenFailure(failure: HttpRequestFailure.notFound);
      return VerifyTokenFailure(failure: HttpRequestFailure.server);
    } on SocketException catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return VerifyTokenFailure(failure: HttpRequestFailure.network);
    } catch (e) {
      if (kDebugMode) {
        logError(e);
      }
      return VerifyTokenFailure(failure: HttpRequestFailure.local);
    }
  }
}
