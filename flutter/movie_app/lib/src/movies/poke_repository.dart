import 'package:dio/dio.dart';
import 'movie_model.dart';

class MovieRepository {
  MovieRepository(this.client);

  final Dio client;

  Future<List<PokemonModel>> getMovies() async{
    try{

      final url = "https://pokeapi.co/api/v2/pokemon?limit=100&offset=200";

      final response = await client.get(url);

      final movies = List<PokemonModel>.of(
        response.data['results'].map<PokemonModel>(
            (json) => PokemonModel(
              title: json['name'],
              urlImage: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full//829.png',
            ),
        ),
      );

      return movies;
    } catch (e){
      throw e;
    }
  }

}