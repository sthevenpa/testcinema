import 'package:testcinema/domain/entities/actor.dart';

abstract class ActorRepository {

  Future<List<Actor>> getActorByMovie( String movieId );

}