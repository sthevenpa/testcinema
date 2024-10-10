
import 'package:testcinema/config/constants/environment.dart';
import 'package:testcinema/domain/datasources/actor_datasource.dart';
import 'package:testcinema/domain/entities/actor.dart';
import 'package:testcinema/infrastructure/mappers/cast_mapper.dart';
import 'package:testcinema/infrastructure/models/themoviedb/credits_response.dart';
import 'package:dio/dio.dart';



class ActorMovieDbDatasource extends ActorDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': Enviroment.tMoviedbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async{
    
    final response = await dio.get(
      'movie/$movieId/credits'
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();
    
    return actors;
  }

}