import 'package:flutter/material.dart';
import 'package:pokedex/DartObjects/Pokemon.do.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';
import 'package:pokedex/api.dart';

class PokeDexHomePage extends StatefulWidget {
  PokeDexHomePage({Key? key, required this.title, foobar}) : super(key: key);

  final String title;

  @override
  _PokeDexHomePageState createState() => _PokeDexHomePageState();
}

class _PokeDexHomePageState extends State<PokeDexHomePage> {
  late Future<PokemonDo> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = getPokemon("ekans");
  }

  var _currentPokemon;
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void handleOnPressed(String text) async {
    print('DEBUG - $futurePokemon');
    print("mycontrol text ${myController.text}");
    print("param $text");

    var pokemon = await getPokemon(myController.text);
    setState(() {
      _currentPokemon = pokemon;
    });
    print("DEBUG after - $pokemon");
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
            child: Column(children: <Widget>[
              TextField(
                onSubmitted: handleOnPressed,
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for Pokémon',
                ),
              ),
              FutureBuilder<PokemonDo>(
                future: futurePokemon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: <Widget>[
                      Text('test'),
                    ]);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              )
            ]),
          )),
    );
  }
}
