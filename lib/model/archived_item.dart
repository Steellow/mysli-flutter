import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ArchivedItem extends Equatable {
  final String name;

  const ArchivedItem({@required this.name});

  @override
  List<Object> get props => [name];

  // Generated methods
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory ArchivedItem.fromMap(Map<String, dynamic> map) {
    return ArchivedItem(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArchivedItem.fromJson(String source) => ArchivedItem.fromMap(json.decode(source));
}
