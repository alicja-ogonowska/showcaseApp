// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) unauthenticated,
    required TResult Function(User? user) loading,
    required TResult Function(User? user) authenticated,
    required TResult Function(User? user, Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserUnathenticatedState value) unauthenticated,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserAuthenticatedState value) authenticated,
    required TResult Function(UserFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
abstract class _$$UserUnathenticatedStateCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserUnathenticatedStateCopyWith(_$UserUnathenticatedState value,
          $Res Function(_$UserUnathenticatedState) then) =
      __$$UserUnathenticatedStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user});
}

/// @nodoc
class __$$UserUnathenticatedStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserUnathenticatedStateCopyWith<$Res> {
  __$$UserUnathenticatedStateCopyWithImpl(_$UserUnathenticatedState _value,
      $Res Function(_$UserUnathenticatedState) _then)
      : super(_value, (v) => _then(v as _$UserUnathenticatedState));

  @override
  _$UserUnathenticatedState get _value =>
      super._value as _$UserUnathenticatedState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserUnathenticatedState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$UserUnathenticatedState implements UserUnathenticatedState {
  const _$UserUnathenticatedState(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'UserState.unauthenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUnathenticatedState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$UserUnathenticatedStateCopyWith<_$UserUnathenticatedState> get copyWith =>
      __$$UserUnathenticatedStateCopyWithImpl<_$UserUnathenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) unauthenticated,
    required TResult Function(User? user) loading,
    required TResult Function(User? user) authenticated,
    required TResult Function(User? user, Failure failure) failure,
  }) {
    return unauthenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
  }) {
    return unauthenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserUnathenticatedState value) unauthenticated,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserAuthenticatedState value) authenticated,
    required TResult Function(UserFailureState value) failure,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UserUnathenticatedState implements UserState {
  const factory UserUnathenticatedState(final User? user) =
      _$UserUnathenticatedState;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserUnathenticatedStateCopyWith<_$UserUnathenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLoadingStateCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserLoadingStateCopyWith(
          _$UserLoadingState value, $Res Function(_$UserLoadingState) then) =
      __$$UserLoadingStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user});
}

/// @nodoc
class __$$UserLoadingStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserLoadingStateCopyWith<$Res> {
  __$$UserLoadingStateCopyWithImpl(
      _$UserLoadingState _value, $Res Function(_$UserLoadingState) _then)
      : super(_value, (v) => _then(v as _$UserLoadingState));

  @override
  _$UserLoadingState get _value => super._value as _$UserLoadingState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserLoadingState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$UserLoadingState implements UserLoadingState {
  const _$UserLoadingState(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'UserState.loading(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoadingState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$UserLoadingStateCopyWith<_$UserLoadingState> get copyWith =>
      __$$UserLoadingStateCopyWithImpl<_$UserLoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) unauthenticated,
    required TResult Function(User? user) loading,
    required TResult Function(User? user) authenticated,
    required TResult Function(User? user, Failure failure) failure,
  }) {
    return loading(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
  }) {
    return loading?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserUnathenticatedState value) unauthenticated,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserAuthenticatedState value) authenticated,
    required TResult Function(UserFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserLoadingState implements UserState {
  const factory UserLoadingState(final User? user) = _$UserLoadingState;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserLoadingStateCopyWith<_$UserLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserAuthenticatedStateCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserAuthenticatedStateCopyWith(_$UserAuthenticatedState value,
          $Res Function(_$UserAuthenticatedState) then) =
      __$$UserAuthenticatedStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user});
}

/// @nodoc
class __$$UserAuthenticatedStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserAuthenticatedStateCopyWith<$Res> {
  __$$UserAuthenticatedStateCopyWithImpl(_$UserAuthenticatedState _value,
      $Res Function(_$UserAuthenticatedState) _then)
      : super(_value, (v) => _then(v as _$UserAuthenticatedState));

  @override
  _$UserAuthenticatedState get _value =>
      super._value as _$UserAuthenticatedState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserAuthenticatedState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$UserAuthenticatedState implements UserAuthenticatedState {
  const _$UserAuthenticatedState(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'UserState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthenticatedState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$UserAuthenticatedStateCopyWith<_$UserAuthenticatedState> get copyWith =>
      __$$UserAuthenticatedStateCopyWithImpl<_$UserAuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) unauthenticated,
    required TResult Function(User? user) loading,
    required TResult Function(User? user) authenticated,
    required TResult Function(User? user, Failure failure) failure,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserUnathenticatedState value) unauthenticated,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserAuthenticatedState value) authenticated,
    required TResult Function(UserFailureState value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class UserAuthenticatedState implements UserState {
  const factory UserAuthenticatedState(final User? user) =
      _$UserAuthenticatedState;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserAuthenticatedStateCopyWith<_$UserAuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserFailureStateCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserFailureStateCopyWith(
          _$UserFailureState value, $Res Function(_$UserFailureState) then) =
      __$$UserFailureStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user, Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$UserFailureStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserFailureStateCopyWith<$Res> {
  __$$UserFailureStateCopyWithImpl(
      _$UserFailureState _value, $Res Function(_$UserFailureState) _then)
      : super(_value, (v) => _then(v as _$UserFailureState));

  @override
  _$UserFailureState get _value => super._value as _$UserFailureState;

  @override
  $Res call({
    Object? user = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$UserFailureState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$UserFailureState implements UserFailureState {
  const _$UserFailureState(this.user, this.failure);

  @override
  final User? user;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'UserState.failure(user: $user, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFailureState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$UserFailureStateCopyWith<_$UserFailureState> get copyWith =>
      __$$UserFailureStateCopyWithImpl<_$UserFailureState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) unauthenticated,
    required TResult Function(User? user) loading,
    required TResult Function(User? user) authenticated,
    required TResult Function(User? user, Failure failure) failure,
  }) {
    return failure(user, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
  }) {
    return failure?.call(user, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? unauthenticated,
    TResult Function(User? user)? loading,
    TResult Function(User? user)? authenticated,
    TResult Function(User? user, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(user, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserUnathenticatedState value) unauthenticated,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserAuthenticatedState value) authenticated,
    required TResult Function(UserFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserUnathenticatedState value)? unauthenticated,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserAuthenticatedState value)? authenticated,
    TResult Function(UserFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UserFailureState implements UserState {
  const factory UserFailureState(final User? user, final Failure failure) =
      _$UserFailureState;

  @override
  User? get user;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$UserFailureStateCopyWith<_$UserFailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
