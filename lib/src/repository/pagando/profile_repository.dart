import 'package:pagando_service/pagando_service.dart';

class ProfileRepository extends RestService {
  ProfileRepository({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  Future<Response<dynamic>> sendOTPChangePhoneNumber(String phone) {
    return postData(Constants.sendPhoneOtp, {'phone': phone});
  }

  Future<Response<dynamic>> changePhoneNumber(String phone, String otpCode) {
    return patchData(
      Constants.changePhone,
      {'newPhone': phone, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> getQuestions() {
    return getData(
      Constants.questions,
    );
  }

  Future<Response<dynamic>> sendOTPChangeEmail(String email) {
    return postData(Constants.sendEmailOtp, {'email': email});
  }

  Future<Response<dynamic>> changeEmail(String email, String otpCode) {
    return patchData(
      Constants.changeEmail,
      {'newEmail': email, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> setSecurityQuestions(List<Map<String, String>> questions) {
    return patchData(
      Constants.questions,
      {'questions': questions},
    );
  }

  Future<Response<dynamic>> changePassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return patchData(
      Constants.changePassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeTransactionPassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return patchData(
      Constants.changeTransactionPassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeNames({required String name}) async {
    return patchData(
      Constants.persons,
      {
        "firstName": name,
      },
    );
  }

  Future<Response> changeLastNames({required String lastName}) async {
    return patchData(
      Constants.persons,
      {
        "secondName": lastName,
      },
    );
  }

  Future<Response> changeBirthDay({required String birthday}) async {
    return patchData(
      Constants.persons,
      {
        "birthDate": birthday,
      },
    );
  }

  Future<Response> changeSex({required String sex}) async {
    return patchData(
      Constants.persons,
      {
        "sex": sex,
      },
    );
  }

  Future<Response> changeDni({String? prefix, String? dni}) async {
    if (prefix == null) {
      return patchData(
        Constants.persons,
        {
          "dni": dni,
        },
      );
    }

    if (dni == null) {
      return patchData(
        Constants.persons,
        {
          "dniTypePrefix": prefix,
        },
      );
    }

    return patchData(
      Constants.persons,
      {
        "dniTypePrefix": prefix,
        "dni": dni,
      },
    );
  }
}
