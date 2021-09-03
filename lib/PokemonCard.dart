import 'package:flutter/material.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';
import 'package:pokedex/utils/capitalize.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required currentPokemon})
      : currentPokemon = currentPokemon,
        super(key: key);

  final PokemonDo currentPokemon;

  @override
  Widget build(BuildContext context) {
    var pkmn = currentPokemon;
    //print(currentPokemon);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("name ${pkmn.name.capitalize()}"),
          Text("height ${pkmn.height.toString()}"),
          Text("id ${pkmn.id.toString()}"),
          Text("order ${pkmn.order.toString()}"),
          Text("weight ${pkmn.weight.toString()}"),
          Container(
            height: 175,
            width: 175,
            color: Colors.lightBlue[50],
            child:
                Image.network(pkmn.sprites.frontDefault, fit: BoxFit.fitWidth),
          )
        ]);
  }
}
