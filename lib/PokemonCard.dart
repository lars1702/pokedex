import 'package:crop/crop.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';
import 'package:pokedex/utils/capitalize.dart';
import 'package:pokedex/utils/toBool.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required currentPokemon})
      : currentPokemon = currentPokemon,
        super(key: key);

  final PokemonDo currentPokemon;

  @override
  Widget build(BuildContext context) {
    var p = currentPokemon;
    final height = toBool(p.height) ? p.height : 1;
    //print(currentPokemon);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("name ${p.name.capitalize()}"),
          Text("height ${height.toString()}"),
          Text("id ${p.id.toString()}"),
          Text("order ${p.order.toString()}"),
          Text("weight ${p.weight.toString()}"),
          Container(
            height: 150,
            width: 150,
            child: Crop(
                backgroundColor: Color(0xffEEEEEE),
                controller: new CropController(scale: height! < 10 ? 1.1 : 1),
                child: Image.network(p.sprites.frontDefault, fit: BoxFit.fill)),
          )
        ]);
  }
}
