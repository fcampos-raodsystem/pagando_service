import 'package:paying_service/checkout_export.dart';

const timeoutInSeconds = 30;

class CheckOutService extends GetxService {
  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  final Dio _dio;
  late CancelToken _cancelToken = CancelToken();
  static Map<String, String>? _mainHeaders;

  static CheckOutService? _instance;

  CheckOutService._({
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

  static CheckOutService getInstance({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) {
    _instance ??= CheckOutService._(
      appBaseUrl: appBaseUrl,
      appBaseDevUrl: appBaseDevUrl,
      isDev: isDev,
    );
    return _instance!;
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
      request: () => _dio.get(
        uri,
        options: Options(headers: _mainHeaders),
        cancelToken: _cancelToken,
      ),
    );
  }

  Future<Response> postData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.post(
        uri,
        data: body,
        options: Options(headers: _mainHeaders),
        cancelToken: _cancelToken,
      ),
      body: body,
    );
  }

  Future<Response> putData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.put(
        uri,
        data: body,
        options: Options(headers: _mainHeaders),
        cancelToken: _cancelToken,
      ),
      body: body,
    );
  }

  Future<Response> patchData(String uri, dynamic body) async {
    return _handleRequest(
      uri,
      request: () => _dio.patch(
        uri,
        data: body,
        options: Options(headers: _mainHeaders),
        cancelToken: _cancelToken,
      ),
      body: body,
    );
  }

  Future<Response> deleteData(String uri) async {
    return _handleRequest(
      uri,
      request: () => _dio.delete(
        uri,
        options: Options(headers: _mainHeaders),
        cancelToken: _cancelToken,
      ),
    );
  }

  Future<Response> _handleRequest(
    String uri, {
    required Future<Response> Function() request,
    dynamic body,
  }) async {
    try {
      logApiCall(uri, body: body);
      return await request();
    } on DioException catch (e) {
      logError(e);
      rethrow;
    } on SocketException catch (e) {
      logError(e);
      rethrow;
    } catch (e) {
      logError(e);
      rethrow;
    }
  }

  void logApiCall(String uri, {dynamic body}) {
    if (kDebugMode) {
      print('====> API Call: $uri\nHeader: ${_mainHeaders} \nBody: $body');
    }
  }

  void logError(dynamic e) {
    if (kDebugMode) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
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
