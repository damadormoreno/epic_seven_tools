import 'package:bloc/bloc.dart';
import 'package:epic_seven_tools/domain/entities/app_error.dart';
import 'package:epic_seven_tools/domain/entities/filter_entity.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/domain/entities/no_params.dart';
import 'package:epic_seven_tools/domain/usecases/get_heroes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'hero_list_state.dart';

class HeroListCubit extends Cubit<HeroListState> {
  final GetHeroes getHeroes;
  List<HeroEntity> heroesRaw;
  HeroListCubit({
    @required this.getHeroes,
    @required this.heroesRaw,
  }) : super(HeroListInitial());

  Future<void> getHeroList() async {
    emit(HeroListLoading());
    final heroesEither = await getHeroes(NoParams());
    heroesEither.fold((l) => emit(HeroListError(l.errorType)), (heroes) {
      this.heroesRaw =
          heroes.where((element) => !element.name.contains("MISSING")).toList();
      emit(
        HeroListLoaded(
          heroes: heroes
              .where((element) => !element.name.contains("MISSING"))
              .toList(),
        ),
      );
    });
  }

  getFilteredList(FilterEntity filter) {
    List<HeroEntity> filteredFirst = [];
    List<HeroEntity> filteredSecond = [];
    List<HeroEntity> filtered = [];

    filter.attributteFilters.removeWhere((key, value) => value == false);
    filter.roleFilters.removeWhere((key, value) => value == false);
    filter.starFilters.removeWhere((key, value) => value == false);

    filter.attributteFilters.forEach((key, value) {
      heroesRaw.forEach((element) {
        if (element.attribute == key) {
          filteredFirst.add(element);
        }
      });
    });

    if (filteredFirst.isNotEmpty) {
      filter.roleFilters.forEach((key, value) {
        if (value == true) {
          filteredFirst.forEach((element) {
            if (element.role == key) {
              filteredSecond.add(element);
            }
          });
        }
      });
    } else {
      filter.roleFilters.forEach((key, value) {
        if (value == true) {
          heroesRaw.forEach((element) {
            if (element.role == key) {
              filteredSecond.add(element);
            }
          });
        }
      });
    }

    if (filteredSecond.isEmpty && filteredFirst.isNotEmpty) {
      filteredSecond = filteredFirst;
    }

    if (filteredSecond.isNotEmpty) {
      filter.starFilters.forEach((key, value) {
        if (value == true) {
          filteredSecond.forEach((element) {
            if (element.rarity == key) {
              filtered.add(element);
            }
          });
        }
      });
    } else {
      filter.starFilters.forEach((key, value) {
        if (value == true) {
          heroesRaw.forEach((element) {
            if (element.rarity == key) {
              filtered.add(element);
            }
          });
        }
      });
    }
    if (filteredSecond.isNotEmpty && filtered.isEmpty) {
      filtered = filteredSecond;
    }

    filtered.sort((a, b) => a.name.compareTo(b.name));
    emit(HeroListLoaded(heroes: filtered));
  }
}
