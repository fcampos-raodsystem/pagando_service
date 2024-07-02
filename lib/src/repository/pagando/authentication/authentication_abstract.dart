import 'package:paying_service/service.dart';

abstract class AuthenticationRepositoryImplement {
  GetMeFuture getMe();

  PostPersonsFuture postPersons({required String dni, required String dniType});

  PostUserSessionsFuture postUserSession({required String firebaseToken});

  PostVerifyFuture postVerifyToken({required String accessToken, required String refreshToken});

  PostResfreshFuture postRefreshToken({required String refreshToken});

  PostLogoutFuture postLogout({required String accessToken, required String refreshToken});

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
}
