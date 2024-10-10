

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testcinema/infrastructure/datasources/actor_themoviedb_datasource.dart';
import 'package:testcinema/infrastructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});