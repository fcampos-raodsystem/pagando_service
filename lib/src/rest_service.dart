import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestService extends GetConnect implements GetxService {
  RestService({
    required this.appBaseUrl,
    required this.appBaseDevUrl,
    required this.isDev,
    required this.store,
    this.token,
  }) {
    token = token;
    updateHeader(token);
    allowAutoSignedCert = true;
  }

  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  final SharedPreferences store;
  static const String noInternetMessage = 'Network connection failed. Please try again.';
  final int timeoutInSeconds = 30;
  final int maxRetry = 2;
  String? token;
  late Map<String, String> _mainHeaders;

  Future<bool> hasInternetConnection() async {
    try {
      if (GetPlatform.isWeb) return true;
      final result = await InternetAddress.lookup("pagando.tech");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      return false;
    } catch (e) {
      print('Unexpected exception: $e');
      return false;
    }
    return false;
  }

  Map<String, String> updateHeader(String? token, {bool setHeader = true}) {
    late Map<String, String> header = {};
    if (token == null) {
      header = <String, String>{'content-type': 'application/json; charset=UTF-8'};
    } else {
      header = <String, String>{'content-type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
    }
    if (setHeader) {
      if (token != null) {
        this.token = token;
      }
      _mainHeaders = header;
    }
    return header;
  }

  Future<Response> getData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      bool hasInternet = await hasInternetConnection();
      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final response = await retry(
        maxAttempts: maxRetry,
        () => get(
          isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return handleResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on GET: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers, int? timeout}) async {
    try {
      bool hasInternet = await hasInternetConnection();

      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final response = await retry(
        maxAttempts: maxRetry,
        () => post(
          isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
          jsonEncode(body),
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeout ?? timeoutInSeconds)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return handleResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on POST: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    try {
      bool hasInternet = await hasInternetConnection();

      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final form = FormData({});
      for (final multipart in multipartBody) {
        form.files.add(MapEntry(
          "file[]",
          MultipartFile(
            multipart.file,
            filename: '${DateTime.now().millisecondsSinceEpoch}.${multipart.file!.name.split(".")}',
          ),
        ));
      }
      final response = post(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        form,
        headers: headers ?? _mainHeaders,
      );

      return handleResponse(response as Response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on POST MU: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      bool hasInternet = await hasInternetConnection();

      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final response = await retry(
        maxAttempts: maxRetry,
        () => put(
          isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
          jsonEncode(body),
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return handleResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on PUT: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> patchData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      bool hasInternet = await hasInternetConnection();
      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final response = await retry(
        maxAttempts: maxRetry,
        () => patch(
          isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
          jsonEncode(body),
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return handleResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on PACTH: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      bool hasInternet = await hasInternetConnection();

      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final response = await retry(
        maxAttempts: maxRetry,
        () => delete(
          isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return handleResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print("Error on DELETE: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(Response response) {
    dynamic body;
    if (response.bodyString != null) {
      try {
        body = jsonDecode(response.bodyString!);
      } catch (_) {}
    }

    if (response.statusCode != null && (response.statusCode! < 200 || response.statusCode! > 299)) {
      final errorResponse = body;
      return Response(
        statusCode: response.statusCode,
        body: body,
        statusText: errorResponse['message'],
      );
    }

    return response;
  }
}

class MultipartBody {
  MultipartBody(this.key, this.file);

  String key;
  XFile? file;
}
