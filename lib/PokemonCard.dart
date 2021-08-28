import 'package:flutter/material.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';
import 'package:pokedex/utils/capitalize.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required currentPokemon,
    required this.myController,
  })  : _currentPokemon = currentPokemon,
        super(key: key);

  final _currentPokemon;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDo>(
      future: _currentPokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: <Widget>[
            Text(snapshot.data!.name.capitalize()),
            Image.network(snapshot.data!.sprites.frontDefault)
          ]);
        } else if (snapshot.hasError) {
          return Text('Error: ${myController.text} not found');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
