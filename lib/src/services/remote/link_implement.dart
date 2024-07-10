import 'package:paying_service/paying_export.dart';

typedef GetLastedLinkFuture = Future<Either<Failure, LinkLastedModel>>;
typedef PostCreateLinkFuture = Future<Either<Failure, LinkLastedModel>>;

abstract class LinkImplement {
  GetLastedLinkFuture getLastedLink({required String userId});
  PostCreateLinkFuture postCreateLink({required String userId});
}
