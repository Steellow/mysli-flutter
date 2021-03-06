import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mysli/model/item.dart';

part 'itemlist_state.dart';

class ItemlistCubit extends Cubit<ItemlistState> with HydratedMixin {
  ItemlistCubit() : super(ItemlistState(items: List<Item>.filled(1, Item(name: "Welcome!"), growable: true)));

  void addItem(Item newItem) {
    List<Item> listWithNewItem = [...state.items, newItem];
    emit(ItemlistState(items: listWithNewItem));
  }

  void tickItem(int index, bool value) {
    List<Item> newList = [...state.items];
    newList[index] = newList[index].copyWith(ticked: value);
    emit(ItemlistState(items: newList));
  }

  void changeAmount(int index, int changeAmount) {
    List<Item> newList = [...state.items];
    Item newItem = newList[index];
    if (newItem.amount + changeAmount < 1) {
      print("Amount is already 1, can't go negative");
      return;
    }
    newList[index] = newItem.copyWith(amount: newItem.amount + changeAmount);
    emit(ItemlistState(items: newList));
  }

  void changeCategory(int index, String category) {
    List<Item> newList = [...state.items];
    newList[index] = newList[index].copyWith(category: category);
    emit(ItemlistState(items: newList));
  }

  void deleteTicked() {
    List<Item> newList = [...state.items].where((e) => !e.ticked).toList();
    emit(ItemlistState(items: newList));
  }

  // Generated methods
  @override
  ItemlistState fromJson(Map<String, dynamic> json) {
    return ItemlistState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(ItemlistState state) {
    return state.toMap();
  }
}
