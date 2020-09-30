import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'movie_cubit.dart';
import 'poke_state.dart';

class MoviePage extends StatefulWidget{
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escoge tu Poke Fvorito'),
      ),
      body: CubitBuilder<MoviesCubit, PokeState>(
        builder: (context, state) {
          if (state is InitialState){
            return Center(
              child: Text("Hello baby, i'am a initial state"),
            );
          } else if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState){
            return Center(
                child: Icon(Icons.close),
            );
          } else if (state is LoadedState){
            final pokemones = state.pokemones;

            return ListView.builder(
                itemCount: pokemones.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title:  Text(pokemones[index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(pokemones[index].urlImage),
                    ),
                  ),
                )
            );
          } else {
            return Container();
          }
        },
      ),
    );

  }
  
}