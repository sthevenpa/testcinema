import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testcinema/domain/entities/actor.dart';
import 'package:testcinema/presentation/providers/providers.dart';

final actorsMovieProvider =
    StateNotifierProvider<ActorsMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider);
  return ActorsMovieNotifier(getActors: actorRepository.getActorByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
