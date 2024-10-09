import 'package:dio/dio.dart';
import 'package:testcinema/config/constants/environment.dart';
import 'package:testcinema/domain/datasources/movies_datasource.dart';
import 'package:testcinema/domain/entities/movie.dart';
import 'package:testcinema/infrastructure/mappers/movie_mapper.dart';
import 'package:testcinema/infrastructure/models/themoviedb/themoviedb_response.dart';

class TheMovieDBDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Enviroment.tMoviedbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing');
    
    final movieDbResponse = TheMovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.themovieDBtoEntity(moviedb)
    ).toList();

    return movies;
  }
}
