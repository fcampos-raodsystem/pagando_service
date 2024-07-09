import 'package:paying_service/service.dart';

typedef PostCreateProductFuture = Future<Either<Failure, LinkLastedModel>>;

abstract class ProductImplement {
  PostCreateProductFuture postCreateProduct({
    required String userId,
    required String title,
    required String description,
    required String price,
    required String countNumber,
    required XFile image,
  });
}
