import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/DartObjects/Pokemon.do.dart';
import 'package:pokedex/DartObjects/models/pokemon_do.dart';

Future<PokemonDo> getPokemon(pokemon) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon/'));
  if (response.statusCode == 200) {
    return PokemonDo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
