import 'package:paying_service/checkout_export.dart';

class ProductsRepository implements ProductImplement {
  final CheckOutService service;

  ProductsRepository({
    required String appBaseUrl,
    required String appBaseDevUrl,
    required bool isDev,
  }) : service = CheckOutService.getInstance(
          appBaseUrl: appBaseUrl,
          appBaseDevUrl: appBaseDevUrl,
          isDev: isDev,
        );

  @override
  CreateProductFuture createProduct({
    required String userId,
    required String title,
    required String description,
    required String price,
    required String countNumber,
    required List<int> image,
  }) async {
    try {
      // await service.deleteData('/products/$productId');

      return Either.goodRequest(LinkLastedModel.fromJson(jsonDecode("")));
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: 'Error de conexión',
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: 'Error local',
      ));
    }
  }

  @override
  DeleteProductFuture deleteProduct({required String productId}) async {
    try {
      await service.deleteData('/products/$productId');
      return Either.goodRequest(true);
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: 'Error de conexión',
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: 'Error local',
      ));
    }
  }

  @override
  EditProductFuture editProductFuture({
    required String productId,
    required String title,
    required String description,
    required String price,
    required String countNumber,
    required List<int> image,
  }) async {
    try {
      var data = FormData.fromMap({
        'image': MultipartFile.fromBytes(
          image,
          filename: 'product.png',
          contentType: DioMediaType.parse('image/png'),
        ),
        'title': title,
        'description': description,
        'price': price,
        'countNumber': countNumber,
      });

      await service.patchData('/products/$productId', {});
      return Either.goodRequest(true);
    } on DioException catch (e) {
      HttpRequestFailure error = HttpRequestFailure.server;

      if (e.response?.statusCode == 404) error = HttpRequestFailure.notFound;
      if (e.response?.statusCode == 401) error = HttpRequestFailure.unauthorized;
      if (e.response?.statusCode == 400) error = HttpRequestFailure.badRequest;

      return Either.badRequest(Failure(
        failure: error,
        message: e.response != null ? jsonEncode(e.response!.data) : "Not data",
      ));
    } on SocketException {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.network,
        message: 'Error de conexión',
      ));
    } catch (_) {
      return Either.badRequest(Failure(
        failure: HttpRequestFailure.local,
        message: 'Error local',
      ));
    }
  }
}
