import 'dart:async';

import 'package:showcase_app/base/common/result/result.dart';
import 'package:showcase_app/base/domain/use_case/params.dart';

abstract class UseCase<T, P extends Params> {
  const UseCase();

  Result<T> call(P? parameters);
}

abstract class AsyncUseCase<T, P extends Params> {
  const AsyncUseCase();

  Future<Result<T>> call(P? parameters);
}

abstract class AsyncUseCaseWithParams<T, P extends Params> {
  const AsyncUseCaseWithParams();

  Future<Result<T>> call(P parameters);
}

abstract class AsyncUseCaseWithoutParams<T> {
  const AsyncUseCaseWithoutParams();

  Future<Result<T>> call();
}

abstract class StreamUseCase<T, P extends Params> {
  const StreamUseCase();

  Result<Stream<T>> call([P? parameters]);
}
