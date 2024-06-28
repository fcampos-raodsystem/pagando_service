import 'package:paying_service/paying_service.dart';

class RestService extends GetxService {
  RestService({
    required this.appBaseUrl,
    required this.appBaseDevUrl,
    required this.isDev,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: isDev ? appBaseDevUrl : appBaseUrl,
      headers: _mainHeaders,
    ));

    _dio.interceptors.add(PayingInterceptor());
  }

  late Dio _dio;
  CancelToken _cancelToken = CancelToken();

  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  final int timeoutInSeconds = 30;
  final int maxRetry = 2;
  static String? jwtToken;
  static Map<String, String>? _mainHeaders;

  Map<String, String>? updateHeader(String? token, {bool setHeader = true}) {
    late Map<String, String> header = {};

    if (setHeader) {
      if (token != null) {
        jwtToken = token;
      }
    }
    if (token == null) {
      header = <String, String>{
        'content-type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
    } else {
      header = <String, String>{
        'content-type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
    }
    _mainHeaders = header;
    return _mainHeaders;
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    return _handleRequest(
      uri,
      request: () => _dio.get(uri, options: Options(headers: headers ?? _mainHeaders)),
    );
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    return _handleRequest(
      uri,
      request: () =>
          _dio.post(uri, data: body, options: Options(headers: headers ?? _mainHeaders)),
    );
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    return _handleRequest(
      uri,
      request: () =>
          _dio.put(uri, data: body, options: Options(headers: headers ?? _mainHeaders)),
    );
  }

  Future<Response> patchData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    return _handleRequest(
      uri,
      request: () =>
          _dio.patch(uri, data: body, options: Options(headers: headers ?? _mainHeaders)),
    );
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    return _handleRequest(
      uri,
      request: () => _dio.delete(uri, options: Options(headers: headers ?? _mainHeaders)),
    );
  }

  Future<Response> _handleRequest(
    String uri, {
    required Future<Response> Function() request,
  }) async {
    final response = await request();
    return handleResponse(response);
  }

  void logApiCall(String uri, {Map<String, String>? headers}) {
    if (kDebugMode) {
      print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
    }
  }

  void logError(dynamic e) {
    if (kDebugMode) {
      print("Error on request: $e");
    }
  }

  Response<dynamic> handleResponse(Response response) {
    return response;
  }

  void cancelRequest() {
    if (kDebugMode) {
      print('====> API Cancelled');
    }
    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }
}
