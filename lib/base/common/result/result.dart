import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// The outcome of a operation.
///
/// An outcome can be either a [ResultSuccess] and return a [T] result
/// or a [ResultFailure] and return a [Failure] error.
@freezed
class Result<T> with _$Result<T> {
  /// Creates a success result of [T] type.
  const factory Result(T result) = ResultSuccess<T>;

  /// Creates a failure result with [error].
  const factory Result.failure(Failure error) = ResultFailure;
}

/// The error returned by a [ResultFailure].
@freezed
class Failure with _$Failure {
  /// Creates a failure with a [value] and [stackTrace].
  const factory Failure(
      dynamic value, [
        StackTrace? stackTrace,
      ]) = _ErrorFailure;
}
