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

  final PokemonDo _currentPokemon;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_currentPokemon.name.capitalize()),
          SizedBox(
              width: 175,
              height: 175,
              child: Image.network(_currentPokemon.sprites.frontDefault,
                  fit: BoxFit.fitWidth))
        ]);
  }
}
