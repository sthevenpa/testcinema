import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final firstLoadingProvider = Provider<bool>((ref) {
  final validacionPlay = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final validacionUp = ref.watch(upComingMoviesProvider).isEmpty;

  if (validacionPlay || validacionUp) return true;

  return false; //Finaliza la carga
});
