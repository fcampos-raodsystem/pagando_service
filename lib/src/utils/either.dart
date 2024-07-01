import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
class Either<L, R> with _$Either<L, R> {
  factory Either.badRequest(L value) = _Left;
  factory Either.goodRequest(R value) = _Right;
}