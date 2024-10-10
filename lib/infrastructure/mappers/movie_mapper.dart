import 'package:testcinema/domain/entities/movie.dart';
import 'package:testcinema/infrastructure/models/themoviedb/movie_details.dart';
import 'package:testcinema/infrastructure/models/themoviedb/movie_themoviedb.dart';

class MovieMapper {
  static Movie themovieDBtoEntity(MovieFromTheMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '') 
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://ih1.redbubble.net/image.4905811390.8675/ur,mouse_pad_small_flatlay_prop,square,1000x1000.jpg',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '') 
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity( MovieDetails moviedb ) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
    genreIds: moviedb.genres.map((e) => e.name ).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );
}
