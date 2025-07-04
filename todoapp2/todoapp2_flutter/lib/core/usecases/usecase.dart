import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);

}