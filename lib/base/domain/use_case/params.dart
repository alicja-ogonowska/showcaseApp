import 'package:equatable/equatable.dart';

abstract class Params extends Equatable {
  const Params();

  @override
  bool get stringify => true;
}

class AnyParams extends Params {
  @override
  List<Object?> get props => [];
}
