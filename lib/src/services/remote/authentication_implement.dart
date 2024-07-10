import 'package:paying_service/paying_export.dart';

typedef PostVerifyFuture = Future<Either<Failure, VerifyModel>>;
typedef PostResfreshFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginWebFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLoginFuture = Future<Either<Failure, AuthLoginModel>>;
typedef PostLogoutFuture = Future<Either<Failure, bool>>;
typedef GetMeFuture = Future<Either<Failure, MeModel>>;
typedef PostNewUserFuture = Future<Either<Failure, bool>>;
typedef PostOtoFuture = Future<Either<Failure, bool>>;
typedef PatchBiometricFuture = Future<Either<Failure, bool>>;
typedef GetFindUserFuture = Future<Either<Failure, UserModel>>;
typedef PostVerifyPasswordFuture = Future<Either<Failure, bool>>;

abstract class AuthenticationImplement {
  GetMeFuture getMe();

  PostVerifyFuture postVerifyToken({required String accessToken, required String refreshToken});

  PostResfreshFuture postRefreshToken({required String refreshToken});

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

  PostLogoutFuture postLogout({required String accessToken, required String refreshToken});

  PostNewUserFuture postNewUser({required String phoneOrEmail, String? personId, String? businessId});

  PostOtoFuture postOtp({required String phoneOrEmail});

  PostPersonsFuture postPersons({required String dni, required String dniType});

  PatchBiometricFuture patchBiometric({required bool biometric});

  GetFindUserFuture getFindUser({required String phoneOrEmail});

  PostVerifyPasswordFuture postVerifyPassword({required String password});
}
