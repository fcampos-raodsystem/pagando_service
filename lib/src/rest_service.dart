import 'package:pagando_service/pagando_service.dart';

class RestService extends GetConnect implements GetxService {
  RestService({
    required this.appBaseUrl,
    required this.appBaseDevUrl,
    required this.isDev,
  }) {
    allowAutoSignedCert = true;

    payingHttpClient = GetHttpClient(
        userAgent: userAgent,
        sendUserAgent: sendUserAgent,
        timeout: timeout,
        followRedirects: followRedirects,
        maxRedirects: maxRedirects,
        maxAuthRetries: maxAuthRetries,
        allowAutoSignedCert: allowAutoSignedCert,
        baseUrl: baseUrl,
        trustedCertificates: trustedCertificates,
        withCredentials: withCredentials,
        findProxy: findProxy);
  }

  late GetHttpClient payingHttpClient;

  final bool isDev;
  final String appBaseDevUrl;
  final String appBaseUrl;
  static const String noInternetMessage = 'Network connection failed. Please try again.';
  final int timeoutInSeconds = 30;
  final int maxRetry = 2;
  static String? jwtToken;
  static Map<String, String>? _mainHeaders;

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

  Map<String, String>? updateHeader(String? token, {bool setHeader = true}) {
    late Map<String, String> header = {};

    if (setHeader) {
      if (token != null) {
        jwtToken = token;
      }
    }
    if (token == null) {
      header = <String, String>{'content-type': 'application/json; charset=UTF-8'};
    } else {
      header = <String, String>{'content-type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $jwtToken'};
    }
    _mainHeaders = header;
    return _mainHeaders;
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final response = await payingHttpClient.get(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response);
    } catch (e) {
      return Response(statusCode: 1, statusText: 'Error on GET: $e');
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      final response = await payingHttpClient.post(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        body: body,
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response);
    } catch (e) {
      return Response(statusCode: 1, statusText: 'Error on POST: $e');
    }
  }

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartFile> multipartFile, {
    Map<String, String>? headers,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body with ${multipartFile.length} file');
      }
      bool hasInternet = await hasInternetConnection();

      if (!hasInternet) {
        return const Response(statusCode: 1, statusText: noInternetMessage);
      }
      final form = FormData({});
      for (final file in multipartFile) {
        form.files.add(MapEntry("file[]", file));
      }

      final response = payingHttpClient.post(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        body: form,
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
      final response = await payingHttpClient.put(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        body: body,
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response);
    } catch (e) {
      return Response(statusCode: 1, statusText: 'Error on PUT: $e');
    }
  }

  Future<Response> patchData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      final response = await payingHttpClient.patch(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        body: body,
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response);
    } catch (e) {
      return Response(statusCode: 1, statusText: 'Error on PATCH: $e');
    }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      final response = await payingHttpClient.delete(
        isDev ? appBaseDevUrl + uri : appBaseUrl + uri,
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response);
    } catch (e) {
      return Response(statusCode: 1, statusText: 'Error on DELETE: $e');
    }
  }

  Response handleResponse(Response response) {
    dynamic body;
    if (response.bodyString != null) {
      try {
        body = jsonDecode(response.bodyString!);
      } catch (_) {}
    }

    if (kDebugMode) {
      print('====> API Response: [${response.statusCode}] ${response.request?.url.toString()}');
      print('${response.bodyString}');
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

  void cancelRequest() {
    payingHttpClient.close();
    payingHttpClient = GetHttpClient(
        userAgent: userAgent,
        sendUserAgent: sendUserAgent,
        timeout: timeout,
        followRedirects: followRedirects,
        maxRedirects: maxRedirects,
        maxAuthRetries: maxAuthRetries,
        allowAutoSignedCert: allowAutoSignedCert,
        baseUrl: baseUrl,
        trustedCertificates: trustedCertificates,
        withCredentials: withCredentials,
        findProxy: findProxy);
  }
}
