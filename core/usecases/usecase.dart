import 'package:coin_dcx/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, List<Type>>> call();
}
