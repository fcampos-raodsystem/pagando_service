import 'package:paying_service/service.dart';


abstract class AuthenticationRepositoryImplement {
  PostUserSessionsFuture postUserSession({required String firebaseToken});

  Future<Authentication> postVerifyToken({required String accessToken, required String refreshToken});

  Future<Authentication> postRefreshToken({required String refreshToken});

  Future<Authentication> postLogout({required String accessToken, required String refreshToken});

  Future<Authentication> postLoginWeb({
    required String phoneOrEmail,
    String? password,
    String? opt,
  });

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
  });

  Future<Persons> postPersons({
    required String dni,
    required String dniType,
  });
}
