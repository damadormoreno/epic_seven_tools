import 'package:bloc/bloc.dart';
import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/domain/entities/no_params.dart';
import 'package:epic_seven_tools/domain/usecases/get_heroes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'hero_list_state.dart';

class HeroListCubit extends Cubit<HeroListState> {
  final GetHeroes getHeroes;

  HeroListCubit({
    @required this.getHeroes,
  }) : super(HeroListInitial());

  Future<void> getHeroList() async {
    emit(HeroListLoading());
    final heroesEither = await getHeroes(NoParams());
    heroesEither.fold(
      (l) => emit(HeroListError(l.errorType)),
      (heroes) => emit(
        HeroListLoaded(
          heroes: heroes,
        ),
      ),
    );
  }
}
