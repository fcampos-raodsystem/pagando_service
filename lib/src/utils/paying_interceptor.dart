import 'package:paying_service/paying_export.dart';

class PayingInterceptor extends Interceptor {
  static const String noInternetMessage = 'Network connection failed. Please try again.';
  Future<bool> hasInternetConnection() async {
    if (GetPlatform.isWeb) return true;

    final result = await InternetAddress.lookup("pagando.tech");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      print('====> TYE REQUEST: [${options.method}]');
      print('====> API Call: ${options.path}');
      print('====> HEADERS: ${options.headers}');
    }

    bool hasInternet = await hasInternetConnection();
    if (!hasInternet) {
      handler.reject(DioException(
        requestOptions: options,
        error: noInternetMessage,
      ));
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('====> STATUS CODE: [${response.statusCode}]');
      print('====> API Call: ${response.requestOptions.path}');
      print('====> BODY: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('====> ERROR[${err.response?.statusCode}]');
      print('====> PATH: ${err.requestOptions.path}');
    }

    super.onError(err, handler);
  }
}
