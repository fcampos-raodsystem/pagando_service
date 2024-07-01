import 'package:paying_service/service.dart';

typedef postVerifyFuture = Future<Either<HttpRequestFailure, VerifyModel>>;
typedef postResfreshFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef postLoginWebFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef postLoginFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef postLogoutFuture = Future<Either<HttpRequestFailure, bool>>;

abstract class AuthenticationImplement {
  postVerifyFuture PostVerify({required String accessToken, required String refreshToken});
  postResfreshFuture PostResfresh({required String refreshToken});
  postLoginWebFuture PostLoginWeb({
    required String phoneOrEmail,
    String? password,
    String? opt,
  });
  postLoginFuture PostLogin({
    required String phoneOrEmail,
    String? password,
    String? opt,
    required String firebaseToken,
    required String deviceBrand,
    required String deviceOS,
    required String deviceModel,
    required String long,
    required String lat,
  });
  postLogoutFuture PostLogout({required String accessToken, required String refreshToken});
}
