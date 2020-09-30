import 'package:equatable/equatable.dart';
import 'movie_model.dart';

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState{
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState{
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState{
  LoadedState(this.pokemones);

  final List<PokemonModel>  pokemones;

  @override
  List<Object> get props => [pokemones];
}

class ErrorState extends MoviesState{
  @override
  List<Object> get props => [];
}