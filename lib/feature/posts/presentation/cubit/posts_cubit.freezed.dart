// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts, Post? postOfTheDay) loaded,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsInitialState value) initial,
    required TResult Function(PostsLoadingState value) loading,
    required TResult Function(PostsLoadedState value) loaded,
    required TResult Function(PostsFailedState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
          PostsState value, $Res Function(PostsState) then) =
      _$PostsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res> implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  final PostsState _value;
  // ignore: unused_field
  final $Res Function(PostsState) _then;
}

/// @nodoc
abstract class _$$PostsInitialStateCopyWith<$Res> {
  factory _$$PostsInitialStateCopyWith(
          _$PostsInitialState value, $Res Function(_$PostsInitialState) then) =
      __$$PostsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostsInitialStateCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res>
    implements _$$PostsInitialStateCopyWith<$Res> {
  __$$PostsInitialStateCopyWithImpl(
      _$PostsInitialState _value, $Res Function(_$PostsInitialState) _then)
      : super(_value, (v) => _then(v as _$PostsInitialState));

  @override
  _$PostsInitialState get _value => super._value as _$PostsInitialState;
}

/// @nodoc

class _$PostsInitialState implements PostsInitialState {
  const _$PostsInitialState();

  @override
  String toString() {
    return 'PostsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostsInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts, Post? postOfTheDay) loaded,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsInitialState value) initial,
    required TResult Function(PostsLoadingState value) loading,
    required TResult Function(PostsLoadedState value) loaded,
    required TResult Function(PostsFailedState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PostsInitialState implements PostsState {
  const factory PostsInitialState() = _$PostsInitialState;
}

/// @nodoc
abstract class _$$PostsLoadingStateCopyWith<$Res> {
  factory _$$PostsLoadingStateCopyWith(
          _$PostsLoadingState value, $Res Function(_$PostsLoadingState) then) =
      __$$PostsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostsLoadingStateCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res>
    implements _$$PostsLoadingStateCopyWith<$Res> {
  __$$PostsLoadingStateCopyWithImpl(
      _$PostsLoadingState _value, $Res Function(_$PostsLoadingState) _then)
      : super(_value, (v) => _then(v as _$PostsLoadingState));

  @override
  _$PostsLoadingState get _value => super._value as _$PostsLoadingState;
}

/// @nodoc

class _$PostsLoadingState implements PostsLoadingState {
  const _$PostsLoadingState();

  @override
  String toString() {
    return 'PostsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts, Post? postOfTheDay) loaded,
    required TResult Function(Failure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsInitialState value) initial,
    required TResult Function(PostsLoadingState value) loading,
    required TResult Function(PostsLoadedState value) loaded,
    required TResult Function(PostsFailedState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PostsLoadingState implements PostsState {
  const factory PostsLoadingState() = _$PostsLoadingState;
}

/// @nodoc
abstract class _$$PostsLoadedStateCopyWith<$Res> {
  factory _$$PostsLoadedStateCopyWith(
          _$PostsLoadedState value, $Res Function(_$PostsLoadedState) then) =
      __$$PostsLoadedStateCopyWithImpl<$Res>;
  $Res call({List<Post> posts, Post? postOfTheDay});
}

/// @nodoc
class __$$PostsLoadedStateCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res>
    implements _$$PostsLoadedStateCopyWith<$Res> {
  __$$PostsLoadedStateCopyWithImpl(
      _$PostsLoadedState _value, $Res Function(_$PostsLoadedState) _then)
      : super(_value, (v) => _then(v as _$PostsLoadedState));

  @override
  _$PostsLoadedState get _value => super._value as _$PostsLoadedState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? postOfTheDay = freezed,
  }) {
    return _then(_$PostsLoadedState(
      posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      postOfTheDay == freezed
          ? _value.postOfTheDay
          : postOfTheDay // ignore: cast_nullable_to_non_nullable
              as Post?,
    ));
  }
}

/// @nodoc

class _$PostsLoadedState implements PostsLoadedState {
  const _$PostsLoadedState(final List<Post> posts, this.postOfTheDay)
      : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final Post? postOfTheDay;

  @override
  String toString() {
    return 'PostsState.loaded(posts: $posts, postOfTheDay: $postOfTheDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsLoadedState &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other.postOfTheDay, postOfTheDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(postOfTheDay));

  @JsonKey(ignore: true)
  @override
  _$$PostsLoadedStateCopyWith<_$PostsLoadedState> get copyWith =>
      __$$PostsLoadedStateCopyWithImpl<_$PostsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts, Post? postOfTheDay) loaded,
    required TResult Function(Failure failure) failure,
  }) {
    return loaded(posts, postOfTheDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
  }) {
    return loaded?.call(posts, postOfTheDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts, postOfTheDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsInitialState value) initial,
    required TResult Function(PostsLoadingState value) loading,
    required TResult Function(PostsLoadedState value) loaded,
    required TResult Function(PostsFailedState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PostsLoadedState implements PostsState {
  const factory PostsLoadedState(
      final List<Post> posts, final Post? postOfTheDay) = _$PostsLoadedState;

  List<Post> get posts;
  Post? get postOfTheDay;
  @JsonKey(ignore: true)
  _$$PostsLoadedStateCopyWith<_$PostsLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostsFailedStateCopyWith<$Res> {
  factory _$$PostsFailedStateCopyWith(
          _$PostsFailedState value, $Res Function(_$PostsFailedState) then) =
      __$$PostsFailedStateCopyWithImpl<$Res>;
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$PostsFailedStateCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res>
    implements _$$PostsFailedStateCopyWith<$Res> {
  __$$PostsFailedStateCopyWithImpl(
      _$PostsFailedState _value, $Res Function(_$PostsFailedState) _then)
      : super(_value, (v) => _then(v as _$PostsFailedState));

  @override
  _$PostsFailedState get _value => super._value as _$PostsFailedState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$PostsFailedState(
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

class _$PostsFailedState implements PostsFailedState {
  const _$PostsFailedState(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PostsState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsFailedState &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$PostsFailedStateCopyWith<_$PostsFailedState> get copyWith =>
      __$$PostsFailedStateCopyWithImpl<_$PostsFailedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts, Post? postOfTheDay) loaded,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts, Post? postOfTheDay)? loaded,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsInitialState value) initial,
    required TResult Function(PostsLoadingState value) loading,
    required TResult Function(PostsLoadedState value) loaded,
    required TResult Function(PostsFailedState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsInitialState value)? initial,
    TResult Function(PostsLoadingState value)? loading,
    TResult Function(PostsLoadedState value)? loaded,
    TResult Function(PostsFailedState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PostsFailedState implements PostsState {
  const factory PostsFailedState(final Failure failure) = _$PostsFailedState;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$PostsFailedStateCopyWith<_$PostsFailedState> get copyWith =>
      throw _privateConstructorUsedError;
}
