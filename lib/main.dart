import 'package:flutter/material.dart';
import 'package:pokedex/PokedexHomePage.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App Title Here',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokeDexHomePage(title: 'Pokedex Home Page', foobar: "lala"),
    );
  }
}
