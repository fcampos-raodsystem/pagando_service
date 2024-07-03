import 'package:paying_service/service.dart';

class ProfileRepository {
  final RestService restService;

  ProfileRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : restService = RestService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> sendOTPChangePhoneNumber(String phone) {
    return restService.postData(Constants.sendPhoneOtp, {'phone': phone});
  }

  Future<Response<dynamic>> changePhoneNumber(String phone, String otpCode) {
    return restService.patchData(
      Constants.changePhone,
      {'newPhone': phone, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> getQuestions() {
    return restService.getData(
      Constants.questions,
    );
  }

  Future<Response<dynamic>> sendOTPChangeEmail(String email) {
    return restService.postData(Constants.sendEmailOtp, {'email': email});
  }

  Future<Response<dynamic>> changeEmail(String email, String otpCode) {
    return restService.patchData(
      Constants.changeEmail,
      {'newEmail': email, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> setSecurityQuestions(List<Map<String, String>> questions) {
    return restService.patchData(
      Constants.questions,
      {'questions': questions},
    );
  }

  Future<Response<dynamic>> changePassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return restService.patchData(
      Constants.changePassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeTransactionPassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return restService.patchData(
      Constants.changeTransactionPassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeNames({required String name}) async {
    return restService.patchData(
      Constants.persons,
      {
        "firstName": name,
      },
    );
  }

  Future<Response> changeLastNames({required String lastName}) async {
    return restService.patchData(
      Constants.persons,
      {
        "secondName": lastName,
      },
    );
  }

  Future<Response> changeBirthDay({required String birthday}) async {
    return restService.patchData(
      Constants.persons,
      {
        "birthDate": birthday,
      },
    );
  }

  Future<Response> changeSex({required String sex}) async {
    return restService.patchData(
      Constants.persons,
      {
        "sex": sex,
      },
    );
  }

  Future<Response> changeDni({String? prefix, String? dni}) async {
    if (prefix == null) {
      return restService.patchData(
        Constants.persons,
        {
          "dni": dni,
        },
      );
    }

    if (dni == null) {
      return restService.patchData(
        Constants.persons,
        {
          "dniTypePrefix": prefix,
        },
      );
    }

    return restService.patchData(
      Constants.persons,
      {
        "dniTypePrefix": prefix,
        "dni": dni,
      },
    );
  }
}
