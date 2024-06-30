import 'package:paying_service/service.dart';

typedef PostVerifyFuture = Future<Either<HttpRequestFailure, VerifyModel>>;
typedef PostResfreshFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef PostLoginWebFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef PostLoginFuture = Future<Either<HttpRequestFailure, AuthLoginModel>>;
typedef PostLogoutFuture = Future<Either<HttpRequestFailure, bool>>;

abstract class AuthenticationImplement {
  PostVerifyFuture PostVerify(String accessToken, String refreshToken);
  PostResfreshFuture PostResfresh(String refreshToken);
  PostLoginWebFuture PostLoginWeb(
    String phoneOrEmail,
    String? password,
    String? opt,
  );
  PostLoginFuture PostLogin(
    String phoneOrEmail,
    String? password,
    String? opt,
    String firebaseToken,
    String deviceBrand,
    String deviceOS,
    String deviceModel,
    String long,
    String lat,
  );
  PostLogoutFuture PostLogout(String accessToken);
}
