import 'package:paying_service/paying_export.dart';

class ProfileRepository {
  final PagandoService service;

  ProfileRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = PagandoService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  Future<Response<dynamic>> sendOTPChangePhoneNumber(String phone) async {
    return await service.postData(Constants.sendPhoneOtp, {'phone': phone});
  }

  Future<Response<dynamic>> changePhoneNumber(String phone, String otpCode) async {
    return await service.patchData(
      Constants.changePhone,
      {'newPhone': phone, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> getQuestions() async {
    return await service.getData(
      Constants.questions,
    );
  }

  Future<Response<dynamic>> sendOTPChangeEmail(String email) async {
    return await service.postData(Constants.sendEmailOtp, {'email': email});
  }

  Future<Response<dynamic>> changeEmail(String email, String otpCode) async {
    return await service.patchData(
      Constants.changeEmail,
      {'newEmail': email, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> setSecurityQuestions(List<Map<String, String>> questions) async {
    return await service.patchData(
      Constants.questions,
      {'questions': questions},
    );
  }

  Future<Response<dynamic>> changePassword(
    String newPassword,
    String repeatNewPassword,
  ) async {
    return await service.patchData(
      Constants.changePassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeTransactionPassword(
    String newPassword,
    String repeatNewPassword,
  ) async {
    return await service.patchData(
      Constants.changeTransactionPassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  Future<Response> changeNames({required String name}) async {
    return await service.patchData(
      Constants.persons,
      {
        "firstName": name,
      },
    );
  }

  Future<Response> changeLastNames({required String lastName}) async {
    return await service.patchData(
      Constants.persons,
      {
        "secondName": lastName,
      },
    );
  }

  Future<Response> changeBirthDay({required String birthday}) async {
    return await service.patchData(
      Constants.persons,
      {
        "birthDate": birthday,
      },
    );
  }

  Future<Response> changeSex({required String sex}) async {
    return await service.patchData(
      Constants.persons,
      {
        "sex": sex,
      },
    );
  }

  Future<Response> changeDni({String? prefix, String? dni}) async {
    if (prefix == null) {
      return await service.patchData(
        Constants.persons,
        {
          "dni": dni,
        },
      );
    }

    if (dni == null) {
      return await service.patchData(
        Constants.persons,
        {
          "dniTypePrefix": prefix,
        },
      );
    }

    return await service.patchData(
      Constants.persons,
      {
        "dniTypePrefix": prefix,
        "dni": dni,
      },
    );
  }
}
