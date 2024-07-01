// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'either.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Either<L, R> {
  Object? get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) badRequest,
    required TResult Function(R value) goodRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(L value)? badRequest,
    TResult? Function(R value)? goodRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? badRequest,
    TResult Function(R value)? goodRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) badRequest,
    required TResult Function(_Right<L, R> value) goodRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Left<L, R> value)? badRequest,
    TResult? Function(_Right<L, R> value)? goodRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? badRequest,
    TResult Function(_Right<L, R> value)? goodRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EitherCopyWith<L, R, $Res> {
  factory $EitherCopyWith(
          Either<L, R> value, $Res Function(Either<L, R>) then) =
      _$EitherCopyWithImpl<L, R, $Res, Either<L, R>>;
}

/// @nodoc
class _$EitherCopyWithImpl<L, R, $Res, $Val extends Either<L, R>>
    implements $EitherCopyWith<L, R, $Res> {
  _$EitherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LeftImplCopyWith<L, R, $Res> {
  factory _$$LeftImplCopyWith(
          _$LeftImpl<L, R> value, $Res Function(_$LeftImpl<L, R>) then) =
      __$$LeftImplCopyWithImpl<L, R, $Res>;
  @useResult
  $Res call({L value});
}

/// @nodoc
class __$$LeftImplCopyWithImpl<L, R, $Res>
    extends _$EitherCopyWithImpl<L, R, $Res, _$LeftImpl<L, R>>
    implements _$$LeftImplCopyWith<L, R, $Res> {
  __$$LeftImplCopyWithImpl(
      _$LeftImpl<L, R> _value, $Res Function(_$LeftImpl<L, R>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$LeftImpl<L, R>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as L,
    ));
  }
}

/// @nodoc

class _$LeftImpl<L, R> implements _Left<L, R> {
  _$LeftImpl(this.value);

  @override
  final L value;

  @override
  String toString() {
    return 'Either<$L, $R>.badRequest(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeftImpl<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeftImplCopyWith<L, R, _$LeftImpl<L, R>> get copyWith =>
      __$$LeftImplCopyWithImpl<L, R, _$LeftImpl<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) badRequest,
    required TResult Function(R value) goodRequest,
  }) {
    return badRequest(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(L value)? badRequest,
    TResult? Function(R value)? goodRequest,
  }) {
    return badRequest?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? badRequest,
    TResult Function(R value)? goodRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) badRequest,
    required TResult Function(_Right<L, R> value) goodRequest,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Left<L, R> value)? badRequest,
    TResult? Function(_Right<L, R> value)? goodRequest,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? badRequest,
    TResult Function(_Right<L, R> value)? goodRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _Left<L, R> implements Either<L, R> {
  factory _Left(final L value) = _$LeftImpl<L, R>;

  @override
  L get value;
  @JsonKey(ignore: true)
  _$$LeftImplCopyWith<L, R, _$LeftImpl<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RightImplCopyWith<L, R, $Res> {
  factory _$$RightImplCopyWith(
          _$RightImpl<L, R> value, $Res Function(_$RightImpl<L, R>) then) =
      __$$RightImplCopyWithImpl<L, R, $Res>;
  @useResult
  $Res call({R value});
}

/// @nodoc
class __$$RightImplCopyWithImpl<L, R, $Res>
    extends _$EitherCopyWithImpl<L, R, $Res, _$RightImpl<L, R>>
    implements _$$RightImplCopyWith<L, R, $Res> {
  __$$RightImplCopyWithImpl(
      _$RightImpl<L, R> _value, $Res Function(_$RightImpl<L, R>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$RightImpl<L, R>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$RightImpl<L, R> implements _Right<L, R> {
  _$RightImpl(this.value);

  @override
  final R value;

  @override
  String toString() {
    return 'Either<$L, $R>.goodRequest(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RightImpl<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RightImplCopyWith<L, R, _$RightImpl<L, R>> get copyWith =>
      __$$RightImplCopyWithImpl<L, R, _$RightImpl<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) badRequest,
    required TResult Function(R value) goodRequest,
  }) {
    return goodRequest(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(L value)? badRequest,
    TResult? Function(R value)? goodRequest,
  }) {
    return goodRequest?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? badRequest,
    TResult Function(R value)? goodRequest,
    required TResult orElse(),
  }) {
    if (goodRequest != null) {
      return goodRequest(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) badRequest,
    required TResult Function(_Right<L, R> value) goodRequest,
  }) {
    return goodRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Left<L, R> value)? badRequest,
    TResult? Function(_Right<L, R> value)? goodRequest,
  }) {
    return goodRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? badRequest,
    TResult Function(_Right<L, R> value)? goodRequest,
    required TResult orElse(),
  }) {
    if (goodRequest != null) {
      return goodRequest(this);
    }
    return orElse();
  }
}

abstract class _Right<L, R> implements Either<L, R> {
  factory _Right(final R value) = _$RightImpl<L, R>;

  @override
  R get value;
  @JsonKey(ignore: true)
  _$$RightImplCopyWith<L, R, _$RightImpl<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
