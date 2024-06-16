import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:pagando_service/pagando_service.dart';

/// This file contains the repository class for profile
class ProfileRepo {
  /// Constructor con parámetros requeridos
  ProfileRepo({required this.apiClient});

  /// Dependencia de RestService
  final RestService apiClient;

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> sendOTPChangePhoneNumber(String phone) {
    return apiClient.postData(Constants.sendPhoneOtp, {'phone': phone});
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> changePhoneNumber(String phone, String otpCode) {
    return apiClient.patchData(
      Constants.changePhone,
      {'newPhone': phone, 'otpCode': otpCode},
    );
  }

  Future<Response<dynamic>> getQuestions() {
    return apiClient.getData(
      Constants.questions,
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> sendOTPChangeEmail(String email) {
    return apiClient.postData(Constants.sendEmailOtp, {'email': email});
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> changeEmail(String email, String otpCode) {
    return apiClient.patchData(
      Constants.changeEmail,
      {'newEmail': email, 'otpCode': otpCode},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> setSecurityQuestions(List<Map<String, String>> questions) {
    return apiClient.patchData(
      Constants.questions,
      {'questions': questions},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response<dynamic>> changePassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return apiClient.patchData(
      Constants.changePassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response> changeTransactionPassword(
    String newPassword,
    String repeatNewPassword,
  ) {
    return apiClient.patchData(
      Constants.changeTransactionPassword,
      {'newPassword': newPassword, 'repeatNewPassword': repeatNewPassword},
    );
  }

  /// Método para obtener el detalle de un perfil
  Future<Response> setProfilePicture(XFile file) {
    final multipartBody = <MultipartBody>[
      MultipartBody('file', file),
    ];
    return apiClient.postMultipartData(
      Constants.imageUpload,
      {},
      multipartBody,
    );
  }

  Future<Response> changeNames({required String name}) async {
    return apiClient.patchData(
      Constants.persons,
      {
        "firstName": name,
      },
    );
  }

  Future<Response> changeLastNames({required String lastName}) async {
    return apiClient.patchData(
      Constants.persons,
      {
        "secondName": lastName,
      },
    );
  }

  Future<Response> changeBirthDay({required String birthday}) async {
    return apiClient.patchData(
      Constants.persons,
      {
        "birthDate": birthday,
      },
    );
  }

  Future<Response> changeSex({required String sex}) async {
    return apiClient.patchData(
      Constants.persons,
      {
        "sex": sex,
      },
    );
  }

  Future<Response> changeDni({String? prefix, String? dni}) async {
    if (prefix == null) {
      return apiClient.patchData(
        Constants.persons,
        {
          "dni": dni,
        },
      );
    }

    if (dni == null) {
      return apiClient.patchData(
        Constants.persons,
        {
          "dniTypePrefix": prefix,
        },
      );
    }

    return apiClient.patchData(
      Constants.persons,
      {
        "dniTypePrefix": prefix,
        "dni": dni,
      },
    );
  }
}
