import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/domain/entities/no_params.dart';
import 'package:epic_seven_tools/domain/usecases/get_heroes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';

abstract class HeroListState extends Equatable {
  const HeroListState();

  @override
  List<Object> get props => [];
}

class HeroListInitial extends HeroListState {}

class HeroListLoading extends HeroListState {}

class HeroListError extends HeroListState {
  final AppErrorType appErrorType;

  const HeroListError(this.appErrorType);
}

class HeroListLoaded extends HeroListState {
  final List<HeroEntity> heroes;

  const HeroListLoaded({
    @required this.heroes,
  });

  @override
  List<Object> get props => [heroes];
}

class FilterListLoaded extends HeroListState {
  final List<HeroEntity> heroes;

  const FilterListLoaded({
    this.heroes,
  });

  @override
  List<Object> get props => [heroes];
}

class HeroListNotifier extends StateNotifier<HeroListState> {
  final GetHeroes _getHeroes;

  HeroListNotifier(this._getHeroes) : super(HeroListInitial());

  Future<void> getHeroList() async {
    state = HeroListLoading();
    final eitherResponse = await _getHeroes.call(NoParams());
    eitherResponse.fold(
      (l) => state = HeroListError(l.errorType),
      (r) => state = HeroListLoaded(heroes: r),
    );
  }
}
