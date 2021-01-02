part of 'hero_list_cubit.dart';

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
    this.heroes,
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
