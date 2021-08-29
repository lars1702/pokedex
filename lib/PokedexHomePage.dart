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
  var _currentPokemon;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    handleGetPokemon("pikachu");
  }

  // Clean up the controller when the widget is disposed.
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void handleGetPokemon(String text) async {
    var pokemon = await getPokemon(text != "" ? text.toLowerCase() : "pikachu");
    setState(() {
      _currentPokemon = pokemon;
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
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextField(
                    onSubmitted: handleGetPokemon,
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search for Pokémon',
                    ),
                  ),
                  PokemonCard(
                      currentPokemon: _currentPokemon,
                      myController: myController)
                ]),
          )),
    );
  }
}
