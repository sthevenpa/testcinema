import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testcinema/infrastructure/datasources/themoviedb_datasource.dart';

import '../../../infrastructure/repositories/movie_repository_impl.dart';

//Repositorio inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDBDatasource());
});
