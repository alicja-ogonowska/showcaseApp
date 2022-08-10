// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index)? tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? tabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationTabSelectedState value) tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$NavigationTabSelectedStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationTabSelectedStateCopyWith(
          _$NavigationTabSelectedState value,
          $Res Function(_$NavigationTabSelectedState) then) =
      __$$NavigationTabSelectedStateCopyWithImpl<$Res>;
  @override
  $Res call({int index});
}

/// @nodoc
class __$$NavigationTabSelectedStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements _$$NavigationTabSelectedStateCopyWith<$Res> {
  __$$NavigationTabSelectedStateCopyWithImpl(
      _$NavigationTabSelectedState _value,
      $Res Function(_$NavigationTabSelectedState) _then)
      : super(_value, (v) => _then(v as _$NavigationTabSelectedState));

  @override
  _$NavigationTabSelectedState get _value =>
      super._value as _$NavigationTabSelectedState;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$NavigationTabSelectedState(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NavigationTabSelectedState implements NavigationTabSelectedState {
  const _$NavigationTabSelectedState(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'NavigationState.tabSelected(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationTabSelectedState &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$NavigationTabSelectedStateCopyWith<_$NavigationTabSelectedState>
      get copyWith => __$$NavigationTabSelectedStateCopyWithImpl<
          _$NavigationTabSelectedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) tabSelected,
  }) {
    return tabSelected(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int index)? tabSelected,
  }) {
    return tabSelected?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? tabSelected,
    required TResult orElse(),
  }) {
    if (tabSelected != null) {
      return tabSelected(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationTabSelectedState value) tabSelected,
  }) {
    return tabSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
  }) {
    return tabSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
    required TResult orElse(),
  }) {
    if (tabSelected != null) {
      return tabSelected(this);
    }
    return orElse();
  }
}

abstract class NavigationTabSelectedState implements NavigationState {
  const factory NavigationTabSelectedState(final int index) =
      _$NavigationTabSelectedState;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$NavigationTabSelectedStateCopyWith<_$NavigationTabSelectedState>
      get copyWith => throw _privateConstructorUsedError;
}
