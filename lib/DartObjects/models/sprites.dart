import 'package:flutter/foundation.dart';

@immutable
class Sprites {
  final String? backDefault;
  final String? backShiny;
  final String frontDefault;
  final String? frontShiny;

  const Sprites({
    this.backDefault,
    this.backShiny,
    required this.frontDefault,
    this.frontShiny,
  });

  @override
  String toString() {
    return 'Sprites(backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny)';
  }

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'] as String?,
        backShiny: json['back_shiny'] as String?,
        frontDefault: json['front_default'] as String,
        frontShiny: json['front_shiny'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  Sprites copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sprites &&
        other.backDefault == backDefault &&
        other.backShiny == backShiny &&
        other.frontDefault == frontDefault &&
        other.frontShiny == frontShiny;
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backShiny.hashCode ^
      frontDefault.hashCode ^
      frontShiny.hashCode;
}
