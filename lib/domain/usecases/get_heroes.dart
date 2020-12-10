import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/domain/entities/no_params.dart';
import 'package:epic_seven_tools/domain/repositories/hero_repository.dart';
import 'package:epic_seven_tools/domain/usecases/usecase.dart';

class GetHeroes extends UseCase<List<HeroEntity>, NoParams> {
  final HeroRepository repository;

  GetHeroes(this.repository);

  @override
  Future<Either<AppError, List<HeroEntity>>> call(NoParams params) async {
    return await repository.getHeroes();
  }
}
