import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String tMoviedbKey = dotenv.env['TMDB_KEY'] ?? 'No hay Api key';
}
