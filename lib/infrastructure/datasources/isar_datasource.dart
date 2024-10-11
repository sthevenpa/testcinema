import 'package:testcinema/domain/datasources/local_storage_datasource.dart';
import 'package:testcinema/domain/entities/movie.dart';

class IsarDatasource extends LocalStorageDatasource {
  @override
  Future<bool> isMovieFavorite(int movieId) async {
    return false;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final List<Movie> listmovie = [];
    return listmovie;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
      return;
  }
}
