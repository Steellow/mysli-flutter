import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final int amount;
  final bool ticked;

  const Item({this.name, this.amount = 1, this.ticked = false});

  @override
  List<Object> get props => [name, amount, ticked];

  // Generated methods:
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'ticked': ticked,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      amount: map['amount'],
      ticked: map['ticked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  Item copyWith({
    String name,
    int amount,
    bool ticked,
  }) {
    return Item(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      ticked: ticked ?? this.ticked,
    );
  }
}
