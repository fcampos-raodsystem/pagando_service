import 'dart:js_interop';

import 'package:paying_service/service.dart';

const timeoutInSeconds = 30;

class RestService extends GetxService {
  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  final Dio _dio;
  late CancelToken _cancelToken = CancelToken();
  static Map<String, String>? _mainHeaders;

  RestService({
    required this.appBaseUrl,
    required this.appBaseDevUrl,
    required this.isDev,
  }) : _dio = Dio(BaseOptions(
          baseUrl: isDev ? appBaseDevUrl : appBaseUrl,
          sendTimeout: Duration(seconds: timeoutInSeconds),
          receiveTimeout: Duration(seconds: timeoutInSeconds),
          connectTimeout: Duration(seconds: timeoutInSeconds),
          followRedirects: false,
          contentType: 'application/json',
        )) {
    _dio.interceptors.add(PayingInterceptor());
    updateHeader(null);
  }

  Map<String, String>? updateHeader(String? token, {bool setHeader = true}) {
    late Map<String, String> header = {};

    if (setHeader) {
      if (token == null) {
        header = <String, String>{
          'content-type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        };
      } else {
        header = <String, String>{
          'content-type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };
      }
    }

    _mainHeaders = header;
    _dio.options.headers = header;
    return _mainHeaders;
  }

  Future<Response> getData(String uri) async {
    return _handleRequest(
      uri,
      request: () => _dio.get(uri, cancelToken: _cancelToken),
    );
  }

  Future<Response> postData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.post(uri, data: body, cancelToken: _cancelToken),
      body: body,
    );
  }

  Future<Response> putData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.put(uri, data: body, cancelToken: _cancelToken),
      body: body,
    );
  }

  Future<Response> patchData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.patch(uri, data: body, cancelToken: _cancelToken),
      body: body,
    );
  }

  Future<Response> deleteData(String uri) async {
    return _handleRequest(
      uri,
      request: () => _dio.delete(uri, cancelToken: _cancelToken),
    );
  }

  Future<Response> _handleRequest(
    String uri, {
    required Future<Response> Function() request,
    dynamic body,
  }) async {
    logApiCall(uri, body: body);
    return await request();
  }

  void logApiCall(String uri, {dynamic body}) {
    if (kDebugMode) {
      print('====> API Call: $uri\nHeader: ${_mainHeaders} \nBody: $body');
    }
  }

  void logError(dynamic e) {
    if (kDebugMode) {
      if (e.response != null) {
        print('Error Response: ${e.response.data}');
        print('Error Headers ${e.response.headers.jsify()}');
        print('Error Options ${e.response.requestOptions.jsify()}');
      } else {
        print(e.jsify());
      }
    }
  }

  void cancelRequest() {
    if (kDebugMode) {
      print('====> API Cancelled');
    }
    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }
}
