import 'package:paying_service/service.dart';

class RestService extends GetXState {
  RestService({
    required this.appBaseUrl,
    required this.appBaseDevUrl,
    required this.isDev,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: isDev ? appBaseDevUrl : appBaseUrl,
      sendTimeout: Duration(seconds: timeoutInSeconds),
      receiveTimeout: Duration(seconds: timeoutInSeconds),
      connectTimeout: Duration(seconds: timeoutInSeconds),
      followRedirects: false,
      contentType: 'application/json',
    ));

    _dio.interceptors.add(PayingInterceptor());
    updateHeader(null);
  }

  late Dio _dio;
  CancelToken _cancelToken = CancelToken();

  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  final int timeoutInSeconds = 30;
  static Map<String, String>? _mainHeaders;

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
    );
  }

  Future<Response> putData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.put(uri, data: body, cancelToken: _cancelToken),
    );
  }

  Future<Response> patchData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.patch(uri, data: body, cancelToken: _cancelToken),
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
  }) async {
    final response = await request();
    return handleResponse(response);
  }

  void logApiCall(String uri, {dynamic headers, dynamic body}) {
    if (kDebugMode) {
      print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders} \nBody: $body');
    }
  }

  void logError(dynamic e) {
    if (kDebugMode) {
      print("Error on request: $e");
      print("Error Response: ${e.response?.data}");
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
