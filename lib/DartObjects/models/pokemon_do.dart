import 'package:flutter/foundation.dart';

import 'sprites.dart';
import 'type.dart';

@immutable
class PokemonDo {
  final int? height;
  final int? id;
  final String name;
  final int? order;
  final Sprites sprites;
  final List<Type>? types;
  final int? weight;

  const PokemonDo({
    this.height,
    this.id,
    required this.name,
    this.order,
    required this.sprites,
    this.types,
    this.weight,
  });

  @override
  String toString() {
    return 'PokemonDo(height: $height, id: $id, name: $name, order: $order, sprites: $sprites, types: $types, weight: $weight)';
  }

  factory PokemonDo.fromJson(Map<String, dynamic> json) => PokemonDo(
        height: json['height'] as int?,
        id: json['id'] as int?,
        name: json['name'] as String,
        order: json['order'] as int?,
        sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
        types: (json['types'] as List<dynamic>?)
            ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
            .toList(),
        weight: json['weight'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'id': id,
        'name': name,
        'order': order,
        'sprites': sprites.toJson(),
        'types': types?.map((e) => e.toJson()).toList(),
        'weight': weight,
      };

  PokemonDo copyWith({
    int? height,
    int? id,
    String? name,
    int? order,
    Sprites? sprites,
    List<Type>? types,
    int? weight,
  }) {
    return PokemonDo(
      height: height ?? this.height,
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      sprites: sprites ?? this.sprites,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDo &&
        listEquals(other.types, types) &&
        other.height == height &&
        other.id == id &&
        other.name == name &&
        other.order == order &&
        other.sprites == sprites &&
        other.weight == weight;
  }

  @override
  int get hashCode =>
      height.hashCode ^
      id.hashCode ^
      name.hashCode ^
      order.hashCode ^
      sprites.hashCode ^
      types.hashCode ^
      weight.hashCode;
}
