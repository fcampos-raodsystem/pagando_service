import 'package:paying_service/service.dart';

typedef PostVerifyFuture = Future<Either<Failure, VerifyModel>>;
typedef PostResfreshFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginWebFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLogoutFuture = Future<Either<Failure, bool>>;
typedef GetMeFuture = Future<Either<Failure, MeModel>>;
typedef PostNewUserFuture = Future<Either<Failure, bool>>;

abstract class AuthenticationImplement {
  GetMeFuture getMe();

  PostVerifyFuture postVerify({required String accessToken, required String refreshToken});

  PostResfreshFuture PostResfresh({required String refreshToken});

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

  PostNewUserFuture postNewUser({required String phoneOrEmail, String? personId, String? businessId});
}
