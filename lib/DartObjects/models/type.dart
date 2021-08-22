import 'package:flutter/foundation.dart';

import 'type_type.dart';

@immutable
class Type {
  final int? slot;
  final Type? type;

  const Type({this.slot, this.type});

  @override
  String toString() => 'Type(slot: $slot, type: $type)';

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] as int?,
        type: json['type'] == null
            ? null
            : Type.fromJson(json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type?.toJson(),
      };

  Type copyWith({
    int? slot,
    Type? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Type && other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
