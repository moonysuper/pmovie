import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pmovie/core/error/failure.dart';

abstract class BaseUseCases<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class NoParameter extends Equatable {

  const NoParameter();

  @override
  List<Object> get props => [];
}