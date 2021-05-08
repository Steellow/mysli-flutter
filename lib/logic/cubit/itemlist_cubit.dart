import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mysli/model/item.dart';

part 'itemlist_state.dart';

class ItemlistCubit extends Cubit<ItemlistState> with HydratedMixin {
  ItemlistCubit() : super(ItemlistState(items: List<Item>.filled(1, Item(name: "test"), growable: true)));

  void addItem(Item newItem) {
    List<Item> listWithNewItem = [...state.items, newItem];
    emit(ItemlistState(items: listWithNewItem));
  }

  void tickItem(int index, bool value) {
    List<Item> newList = [...state.items];
    newList[index].checked = value;
    emit(ItemlistState(items: newList));
  }

  void deleteTicked() {
    List<Item> newList = [...state.items].where((e) => !e.checked).toList();
    emit(ItemlistState(items: newList));
  }

  @override
  ItemlistState fromJson(Map<String, dynamic> json) {
    return ItemlistState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(ItemlistState state) {
    return state.toMap();
  }
}
