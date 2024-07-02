import 'package:paying_service/service.dart';

abstract class Authentication {}

class VerifyTokenSuccess extends Authentication {
  VerifyTokenSuccess({required this.verifyModel});
  final VerifyModel verifyModel;
}

class VerifyTokenFailure extends Authentication {
  VerifyTokenFailure({required this.failure});
  final HttpRequestFailure failure;
}

class RefreshTokenSuccess extends Authentication {
  RefreshTokenSuccess({required this.authLoginModel});
  final AuthLoginModel authLoginModel;
}

class RefreshTokenFailure extends Authentication {
  RefreshTokenFailure({required this.failure});
  final HttpRequestFailure failure;
}

class LoginFailure extends Authentication {
  final HttpRequestFailure failure;
  final String? message;
  LoginFailure({required this.failure, this.message});
}


class LogoutFailure extends Authentication {
  LogoutFailure({required this.failure});
  final HttpRequestFailure failure;
}
