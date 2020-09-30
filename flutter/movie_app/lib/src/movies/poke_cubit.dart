import 'package:cubit/cubit.dart';
import 'poke_repository.dart';
import 'poke_state.dart';

class MoviesCubit extends Cubit<PokeState> {
  MoviesCubit({this.repository}) : super(InitialState()){
    _getTrendingMovies();
  }

  final PokeRepository repository;

  void _getTrendingMovies() async{
    try{
      emit(LoadingState());
      final movies = await repository.getPokemones();
      emit(LoadedState(movies));
    } catch (e){
      emit(ErrorState());
    }
  }

}