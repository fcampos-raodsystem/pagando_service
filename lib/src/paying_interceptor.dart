import 'package:pagando_service/pagando_service.dart';

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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool hasInternet = await hasInternetConnection();
    if (!hasInternet) {
      handler.reject(DioException(
        requestOptions: options,
        error: noInternetMessage,
      ));
    } else {
      handler.next(options);
    }
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    // if (response.statusCode! < 200 || response.statusCode! > 299) {
    //   return handler.reject(DioException(
    //     requestOptions: response.requestOptions,
    //     response: Response(
    //       statusCode: response.statusCode,
    //       requestOptions: response.requestOptions,
    //       data: response.data,
    //     ),
    //     type: DioExceptionType.badResponse,
    //   ));
    // }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is DioException && (err.error as DioException).message == noInternetMessage) {
      handler.next(DioException(
        requestOptions: err.requestOptions,
        error: noInternetMessage,
        response: Response(
          statusCode: 1,
          requestOptions: err.requestOptions,
          data: err.response?.data,
        ),
      ));
    } else {
      handler.next(err);
    }
  }
}