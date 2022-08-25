import 'package:flutter/material.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';
import 'package:pokedex/PokemonCard.dart';
import 'package:pokedex/api.dart';

class PokeDexHomePage extends StatefulWidget {
  PokeDexHomePage({Key? key, required this.title, foobar}) : super(key: key);
  final String title;
  @override
  _PokeDexHomePageState createState() => _PokeDexHomePageState();
}

class _PokeDexHomePageState extends State<PokeDexHomePage> {
  late PokemonDo futurePokemon;
  var currentPokemon;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    handleGetPokemon("pikachu");
  }

  void handleGetPokemon(String text) async {
    text = text.toLowerCase().trim();
    var pokemon = await getPokemon(text);
    setState(() {
      currentPokemon = pokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: FractionalOffset.topCenter,
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                onSubmitted: handleGetPokemon,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for Pokémon',
                ),
              ),
              PokemonCard(currentPokemon: currentPokemon)
            ]),
      ),
    );
  }
}
