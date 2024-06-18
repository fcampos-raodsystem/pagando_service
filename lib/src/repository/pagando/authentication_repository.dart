import 'package:pagando_service/pagando_service.dart';

class AuthenticationRepository extends RestService {
  AuthenticationRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> getCIData(String dniType, String dni) {
    return postData(
      Constants.persons,
      {'dni': dni, 'dniTypePrefix': dniType},
    );
  }

  Future<Response<dynamic>> createPerson({
    required String first,
    required String seconds,
    required String dni,
    required String dniType,
  }) {
    return postData(Constants.persons, {
      'firstName': first,
      'secondName': seconds,
      'dni': dni,
      'dniTypePrefix': dniType,
    });
  }

  Future<Response<dynamic>> postNewUser({
    required String phoneOrEmail,
    required String idPerson,
  }) {
    return postData(Constants.newUser, {
      'phoneOrEmail': phoneOrEmail,
      'personId': idPerson,
    });
  }

  Future<Response<dynamic>> sendOTP({required String phoneOrEmail}) {
    return postData(Constants.sendOtp, {
      'phoneOrEmail': phoneOrEmail,
    });
  }

  Future<Response<dynamic>> verifyOTP({
    required String otp,
    required String phoneOrEmail,
  }) {
    return getData(
      '${Constants.verifyOtp}?code=$otp&phoneOrEmail=$phoneOrEmail',
    );
  }

  Future<Response<dynamic>> findUser({required String phoneOrEmail}) {
    return getData(
      '${Constants.findUser}?phoneOrEmail=$phoneOrEmail',
    );
  }

  Future<Response> login({
    required String phoneOrEmail,
    String? password,
    String? otp,
    required String deviceToken,
    required String deviceBrand,
    required String deviceOS,
    required String deviceModel,
    required String long,
    required String lat,
  }) {
    if (password != null) {
      return postData(Constants.authLogin, {
        'phoneOrEmail': phoneOrEmail,
        'password': password,
        'userSession': {
          'firebaseToken': deviceToken,
          'device': deviceBrand,
          'so': deviceOS,
          'model': deviceModel,
          'long': long,
          'lat': lat,
        },
      });
    }
    return postData(Constants.authLogin, {
      'phoneOrEmail': phoneOrEmail,
      'otpCode': otp,
      'userSession': {
        'firebaseToken': deviceToken,
        'device': deviceBrand,
        'so': deviceOS,
        'model': deviceModel,
        'long': long,
        'lat': lat,
      },
    });
  }

  Future<Response> getMe() {
    return getData(Constants.me);
  }

  bool saveUserToken(String t) {
    updateHeader(t);
    return true;
  }

  Future<Response> setBiometric({bool biometric = false}) {
    return patchData(Constants.setBiometric, {
      'hasBiometric': biometric,
    });
  }

  Future<Response> logout({String? jwt = '', String? refresh = ''}) {
    return postData(Constants.authLogout, {
      'accessToken': jwt,
      'refreshToken': refresh,
    });
  }

  Future<Response> verifyTokens({String? jwt, String? refresh}) {
    if (jwt == null || refresh == null) {
      final json = VerifyModel(message: 'nullos', data: VerifyData(refreshTokenVerify: false, accessTokenVerify: false));

      return Future.value(Response(body: json.toJson().toString()));
    }

    return postData(Constants.verifyToken, {
      'accessToken': jwt,
      'refreshToken': refresh,
    });
  }

  Future<Response> refreshToken({required String refreshToken}) {
    if (refreshToken.isEmpty) {
      final json = Tokens(accessToken: '', refreshToken: '');

      return Future.value(Response(body: json.toJson().toString()));
    }

    return postData(Constants.refreshToken, {
      'refreshToken': refreshToken,
    });
  }

  Future<Response> passwordVerify({required String password}) {
    return postData(Constants.passwordVerify, {
      'password': password,
    });
  }
}
