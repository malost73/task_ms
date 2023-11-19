// import 'package:dartz/dartz.dart';
// import 'package:rick_and_morty/core/error/api_result_model.dart';
//
// abstract class UseCase<Type, Params> {
//   Future<Either<Failure, Type>> call(Params params);
// }

import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
