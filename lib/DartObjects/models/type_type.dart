import 'package:flutter/foundation.dart';

@immutable
class Type {
  final String? name;
  final String? url;

  const Type({this.name, this.url});

  @override
  String toString() => 'Type(name: $name, url: $url)';

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Type copyWith({
    String? name,
    String? url,
  }) {
    return Type(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Type && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
