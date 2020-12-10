import 'package:epic_seven_tools/data/core/api_client.dart';
import 'package:epic_seven_tools/data/models/hero_model.dart';
import 'package:epic_seven_tools/data/models/heroes_result_model.dart';

abstract class HeroRemoteDataSource {
  /* 
  Future<MovieDetailModel> getMovieDetail(int id); */
  Future<List<HeroModel>> getHeroes();
}

class HeroRemoteDataSourceImpl extends HeroRemoteDataSource {
  final ApiClient _client;

  HeroRemoteDataSourceImpl(this._client);

  @override
  Future<List<HeroModel>> getHeroes() async {
    final response = await _client.get("hero");
    final heroes = HeroesResultModel.fromJson(response).heroes;
    print(heroes);
    return heroes;
  }

  /* @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get("movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get("movie/$id");
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  } */
}
