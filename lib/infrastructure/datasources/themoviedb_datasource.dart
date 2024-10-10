import 'package:dio/dio.dart';
import 'package:testcinema/config/constants/environment.dart';
import 'package:testcinema/domain/datasources/movies_datasource.dart';
import 'package:testcinema/domain/entities/movie.dart';
import 'package:testcinema/infrastructure/mappers/movie_mapper.dart';
import 'package:testcinema/infrastructure/models/themoviedb/movie_details.dart';
import 'package:testcinema/infrastructure/models/themoviedb/themoviedb_response.dart';

class TheMovieDBDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Enviroment.tMoviedbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = TheMovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.themovieDBtoEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('movie/now_playing', queryParameters: {'page': page});

   return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

   @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if ( response.statusCode != 200 ) throw Exception('Movie with id: $id not found');
    
    final movieDetails = MovieDetails.fromJson( response.data );
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }
}
