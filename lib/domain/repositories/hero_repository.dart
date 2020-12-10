import 'package:dartz/dartz.dart';
import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';

abstract class HeroRepository {
  /* 
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id); */

  Future<Either<AppError, List<HeroEntity>>> getHeroes();
}
