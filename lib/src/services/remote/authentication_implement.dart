import 'package:paying_service/service.dart';

typedef postVerifyFuture = Future<Either<Failure, VerifyModel>>;
typedef postResfreshFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginWebFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLogoutFuture = Future<Either<Failure, bool>>;
typedef GetMeFuture = Future<Either<Failure, MeModel>>;

abstract class AuthenticationImplement {
  GetMeFuture getMe();

  postVerifyFuture postVerify({required String accessToken, required String refreshToken});

  postResfreshFuture PostResfresh({required String refreshToken});

  PostLoginWebFuture postLoginWeb({
    required String phoneOrEmail,
    String? password,
    String? opt,
  });

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
  });

  PostLogoutFuture PostLogout({required String accessToken, required String refreshToken});
}
