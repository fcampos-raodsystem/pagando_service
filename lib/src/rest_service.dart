import 'package:get/get_connect/http/src/request/request.dart';
import 'package:pagando_service/pagando_service.dart';
import 'package:http/http.dart' as http;

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
      header = <String, String>{'content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json',};
    } else {
      header = <String, String>{'content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json', 'Authorization': 'Bearer $jwtToken',};
    }
    _mainHeaders = header;
    return _mainHeaders;
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Header: ${headers ?? _mainHeaders}');
      }
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
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Header: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }

      if(headers != null){
        headers['content-length'] = bodyString.length.toString(); 
      }else{
        _mainHeaders['content-length'] = bodyString.length.toString(); 
      }


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

  Future<Response<dynamic>> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }
      final request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders!);
      for (final multipart in multipartBody) {
        if (multipart.file != null) {
          final list = await multipart.file!.readAsBytes();
          final compressedList = await FlutterImageCompress.compressWithList(
            list,
            minHeight: 1920,
            minWidth: 1080,
            quality: 88,
          );
          request.files.add(
            http.MultipartFile(
              multipart.key,
              Stream.fromIterable(compressedList.map((e) => [e])),
              compressedList.length,
              filename: '${DateTime.now()}.png',
            ),
          );
        }
      }
      request.fields.addAll(body);
      final response = await http.Response.fromStream(await request.send());

      return handleHttpResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print("Error on POST MU: $e");
      }
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Header: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
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
      f (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Header: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
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
      f (kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Header: ${headers ?? _mainHeaders}');
      }
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

  Response<dynamic> handleHttpResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    var response0 = Response(
      body: body ?? response.body,
      bodyString: response.body,
      request: Request(
        headers: response.request!.headers,
        method: response.request!.method,
        url: response.request!.url,
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != null) {
      if (response0.statusCode! < 200 || response.statusCode > 299) {
        final errorResponse = ErrorsData.fromJson(response0.body);
        response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: errorResponse.message,
        );
      } else if (response0.statusCode != 200 && response0.body == null) {
        response0 = const Response(statusCode: 0, statusText: noInternetMessage);
      }
    }

    if (kDebugMode) {
      print('====> API Response: [${response0.statusCode}] $uri');
      if (response.statusCode != 500) {
        print('${response0.body}');
      }
    }
    return response0;
  }

  void cancelRequest() {
    f (kDebugMode) {
      print('====> API Cancelled');
    }
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

class MultipartBody {
  /// {@macro multipart_body}
  /// [key] is the key of the file
  /// [file] is the file to be uploaded
  MultipartBody(this.key, this.file);

  /// Key
  String key;

  /// File
  XFile? file;
}
