import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:mysli/util/const.dart';

class Item extends Equatable {
  final String name;
  final int amount;
  final bool ticked;
  final String category;

  const Item({this.name, this.amount = 1, this.ticked = false, this.category = UNCATEGORIZED});

  @override
  List<Object> get props => [name, amount, ticked, category];

  // Generated methods:
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'ticked': ticked,
      'category': category,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      amount: map['amount'],
      ticked: map['ticked'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  Item copyWith({
    String name,
    int amount,
    bool ticked,
    String category,
  }) {
    return Item(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      ticked: ticked ?? this.ticked,
      category: category ?? this.category,
    );
  }
}
