import 'package:paying_service/paying_export.dart';

part 'functions/post_user_session.dart';
part 'functions/post_logout.dart';
part 'functions/post_refresh_token.dart';
part 'functions/post_verify_token.dart';
part 'functions/post_persons.dart';
part 'functions/login_web.dart';
part 'functions/login.dart';
part 'functions/me.dart';
part 'functions/new_user.dart';
part 'functions/post_otp.dart';
part 'functions/patch_biometric.dart';
part 'functions/find_user.dart';
part 'functions/verify_password.dart';

class AuthenticationRepository implements UserSessionImplement, AuthenticationImplement {
  final PagandoService service;

  AuthenticationRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  @override
  PostUserSessionFuture postUserSession({
    required String firebaseToken,
  }) async =>
      UserSession(
        firebaseToken: firebaseToken,
      );

  @override
  PostLogoutFuture postLogout({
    required String accessToken,
    required String refreshToken,
  }) async =>
      Logout(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  @override
  PostResfreshFuture postRefreshToken({
    required String refreshToken,
  }) async =>
      RefreshToken(
        refreshToken: refreshToken,
      );

  @override
  PostVerifyFuture postVerifyToken({
    required String accessToken,
    required String refreshToken,
  }) async =>
      VerifyToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  @override
  PostPersonsFuture postPersons({
    required String dni,
    required String dniType,
  }) async =>
      FetchPersons(dni: dni, dniType: dniType);

  @override
  PostLoginFuture postLoginWeb({
    required String phoneOrEmail,
    String? password,
    String? opt,
  }) async =>
      LoginWeb(
        phoneOrEmail: phoneOrEmail,
        password: password,
        opt: opt,
      );

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
  }) async =>
      Login(
        phoneOrEmail: phoneOrEmail,
        firebaseToken: firebaseToken,
        deviceBrand: deviceBrand,
        deviceOS: deviceOS,
        deviceModel: deviceModel,
        long: long,
        lat: lat,
        password: password,
        opt: opt,
      );

  @override
  GetMeFuture getMe() async => Me();

  @override
  PostNewUserFuture postNewUser({
    required String phoneOrEmail,
    String? personId,
    String? businessId,
  }) async =>
      NewUser(
        phoneOrEmail: phoneOrEmail,
        personId: personId,
        businessId: businessId,
      );

  @override
  PostOtoFuture postOtp({
    required String phoneOrEmail,
  }) async =>
      Otp(
        phoneOrEmail: phoneOrEmail,
      );

  @override
  PatchBiometricFuture patchBiometric({
    required bool biometric,
  }) async =>
      pBiometric(
        biometric: biometric,
      );

  @override
  GetFindUserFuture getFindUser({
    required String phoneOrEmail,
  }) async =>
      FindUser(
        phoneOrEmail: phoneOrEmail,
      );

  @override
  PostVerifyPasswordFuture postVerifyPassword({
    required String password,
  }) async =>
      VerifyPassword(
        password: password,
      );
}
