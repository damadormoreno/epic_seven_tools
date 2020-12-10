import 'package:dartz/dartz.dart';
import 'package:epic_seven_tools/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
