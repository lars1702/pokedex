class Pokemon {
  final String name;
  final sprite;
  final int order;
  final types;

  Pokemon({
    required this.name,
    required this.sprite,
    required this.order,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      sprite: json['sprites.front_default'],
      order: json['order'],
      types: json['types'],
    );
  }
}
