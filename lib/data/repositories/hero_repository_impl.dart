import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:epic_seven_tools/data/data_sources/epic_seven_remote_data_source.dart';
import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/domain/repositories/hero_repository.dart';

class HeroRepositoryImpl extends HeroRepository {
  final HeroRemoteDataSource heroRemoteDataSource;

  HeroRepositoryImpl(this.heroRemoteDataSource);

  @override
  Future<Either<AppError, List<HeroEntity>>> getHeroes() async {
    try {
      final heroes = await heroRemoteDataSource.getHeroes();
      return Right(heroes);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
