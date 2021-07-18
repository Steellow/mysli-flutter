import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:mysli/util/const.dart';

class ArchivedItem extends Equatable {
  final String name;
  final String category;

  const ArchivedItem({@required this.name, this.category = UNCATEGORIZED});

  @override
  List<Object> get props => [name];

  // Generated methods
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
    };
  }

  factory ArchivedItem.fromMap(Map<String, dynamic> map) {
    return ArchivedItem(
      name: map['name'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArchivedItem.fromJson(String source) => ArchivedItem.fromMap(json.decode(source));

  ArchivedItem copyWith({
    String name,
    String category,
  }) {
    return ArchivedItem(
      name: name ?? this.name,
      category: category ?? this.category,
    );
  }
}
