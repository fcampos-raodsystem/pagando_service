import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// This file contains the repository class for profile
class ProfileRepo extends RestService{
  /// Constructor con parámetros requeridos
  ProfileRepo({required super.appBaseUrl, required super.appBaseDevUrl, required super.isDev});

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> sendOTPChangePhoneNumber(String phone) {
    return postData(Constants.sendPhoneOtp, {'phone': phone});
  }

  /// Método para obtener el detalle de un perfil
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

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> sendOTPChangeEmail(String email) {
    return postData(Constants.sendEmailOtp, {'email': email});
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> changeEmail(String email, String otpCode) {
    return patchData(
      Constants.changeEmail,
      {'newEmail': email, 'otpCode': otpCode},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> setSecurityQuestions(List<Map<String, String>> questions) {
    return patchData(
      Constants.questions,
      {'questions': questions},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> changePassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return patchData(
      Constants.changePassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response> changeTransactionPassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return patchData(
      Constants.changeTransactionPassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response> setProfilePicture(XFile file) {
    final multipartBody = <MultipartBody>[
      MultipartBody('file', file),
    ];
    return postMultipartData(
      Constants.imageUpload,
      {},
      multipartBody,
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
