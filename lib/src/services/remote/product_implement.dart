import 'package:paying_service/checkout_export.dart';

typedef CreateProductFuture = Future<Either<Failure, LinkLastedModel>>;
typedef DeleteProductFuture = Future<Either<Failure, bool>>;
typedef EditProductFuture = Future<Either<Failure, bool>>;

abstract class ProductImplement {
  CreateProductFuture createProduct({
    required String userId,
    required String title,
    required String description,
    required String price,
    required String countNumber,
    required List<int> image,
  });

  DeleteProductFuture deleteProduct({
    required String productId,
  });

  EditProductFuture editProductFuture({
    required String productId,
    required String title,
    required String description,
    required String price,
    required String countNumber,
    required List<int> image,
  });
}
