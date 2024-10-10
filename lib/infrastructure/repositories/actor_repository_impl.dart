import 'package:testcinema/domain/datasources/actor_datasource.dart';
import 'package:testcinema/domain/entities/actor.dart';
import 'package:testcinema/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}
