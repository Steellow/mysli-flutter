import 'package:equatable/equatable.dart';

class Item extends Equatable {
  String name;

  Item(String name) {
    this.name = name;
  }

  @override
  List<Object> get props => [name];
}
