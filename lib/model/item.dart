import 'package:equatable/equatable.dart';

class Item extends Equatable {
  String name;
  int amount;
  bool checked;

  Item({this.name, this.amount = 1, this.checked = false});

  @override
  List<Object> get props => [name];
}
