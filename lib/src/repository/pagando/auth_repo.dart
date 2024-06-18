import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// {{@template auth_repo}}
/// Repository for authentication
class AuthRepo extends RestService{
  /// Constructor
  /// [apiClient] API client
  /// [sharedPreferences] Shared preferences
  AuthRepo({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  /// {{@template getDniTypes}}
  /// Get DNI types
  ///
  /// [dniType] DNI type
  /// [dni] DNI
  ///
  /// [Response] response
  /// {{@endtemplate}}
  Future<Response<dynamic>> getCIData(String dniType, String dni) {
    return postData(
      Constants.persons,
      {'dni': dni, 'dniTypePrefix': dniType},
    );
  }

  /// {{@template createPerson}}
  /// Create a new person
  /// [first] first name
  /// [seconds] second name
  /// [dni] dni
  /// [dniType] dni type
  /// {{@endtemplate}}
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

  /// {{@template postNewUser}}
  /// Post new user
  /// {{@endtemplate}}
  Future<Response<dynamic>> postNewUser({
    required String phoneOrEmail,
    required String idPerson,
  }) {
    return postData(Constants.newUser, {
      'phoneOrEmail': phoneOrEmail,
      'personId': idPerson,
    });
  }

  /// {{@template sendOTP}}
  /// Send OTP
  /// [phoneOrEmail] Phone or email
  /// {{@endtemplate}}
  Future<Response<dynamic>> sendOTP({required String phoneOrEmail}) {
    return postData(Constants.sendOtp, {
      'phoneOrEmail': phoneOrEmail,
    });
  }

  /// {{@template verifyOTP}}
  /// Verify OTP
  /// [otp] OTP
  Future<Response<dynamic>> verifyOTP({
    required String otp,
    required String phoneOrEmail,
  }) {
    return getData(
      '${Constants.verifyOtp}?code=$otp&phoneOrEmail=$phoneOrEmail',
    );
  }

  /// {{@template findUser}}
  /// Find user
  /// [phoneOrEmail] Phone or email
  /// {{@endtemplate}}
  Future<Response<dynamic>> findUser({required String phoneOrEmail}) {
    return getData(
      '${Constants.findUser}?phoneOrEmail=$phoneOrEmail',
    );
  }

  /// {{@template login}}
  /// Login
  /// [phoneOrEmail] Phone or email
  /// [otp] OTP
  /// [password] Password
  /// [deviceToken] Device token
  /// [deviceBrand] Device brand
  /// [deviceOS] Device OS
  /// [deviceModel] Device model
  /// [long] Longitude
  /// [lat] Latitude
  /// {{@endtemplate}}
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

  /// {{@template getMe}}
  /// Get me
  /// {{@endtemplate}}
  Future<Response> getMe() {
    return getData(Constants.me);
  }

  /// {{@template saveUserToken}}
  /// Save user token
  /// [t] Token
  bool saveUserToken(String t) {
    updateHeader(t);
    return true;
  }

  /// {{@template setBiometric}}
  /// Set biometric
  /// [biometric] Biometric
  /// {{@endtemplate}}
  Future<Response> setBiometric({bool biometric = false}) {
    return patchData(Constants.setBiometric, {
      'hasBiometric': biometric,
    });
  }

  /// {{@template logout}}
  /// Logout
  /// [jwt] JWT
  /// [refresh] Refresh token
  /// {{@endtemplate}}
  Future<Response> logout({String? jwt = '', String? refresh = ''}) {
    return postData(Constants.authLogout, {
      'accessToken': jwt,
      'refreshToken': refresh,
    });
  }

  /// {{@template verifyTokens}}
  /// Verify tokens
  /// [jwt] JWT
  /// [refresh] Refresh token
  /// {{@endtemplate}}
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
