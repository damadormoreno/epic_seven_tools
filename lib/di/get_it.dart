import 'package:epic_seven_tools/data/core/api_client.dart';
import 'package:epic_seven_tools/data/data_sources/epic_seven_remote_data_source.dart';
import 'package:epic_seven_tools/data/repositories/hero_repository_impl.dart';
import 'package:epic_seven_tools/domain/repositories/hero_repository.dart';
import 'package:epic_seven_tools/domain/usecases/get_heroes.dart';
import 'package:epic_seven_tools/presentation/blocs/hero_list/hero_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Network
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Datasource
  getItInstance.registerLazySingleton<HeroRemoteDataSource>(
      () => HeroRemoteDataSourceImpl(getItInstance()));

  //Usecases
  getItInstance
      .registerLazySingleton<GetHeroes>(() => GetHeroes(getItInstance()));

  //Repositories
  getItInstance.registerLazySingleton<HeroRepository>(
      () => HeroRepositoryImpl(getItInstance()));

  //Blocs

  getItInstance.registerLazySingleton(() => HeroListCubit(
        getHeroes: getItInstance(),
        heroesRaw: [],
      ));

  //getItInstance.registerFactory(() => CheckBoxCubit(heroes: []));
}
