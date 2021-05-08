import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  String name;
  int amount;
  bool checked;

  Item({this.name, this.amount = 1, this.checked = false});

  @override
  List<Object> get props => [name, amount, checked];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'checked': checked,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      amount: map['amount'],
      checked: map['checked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
