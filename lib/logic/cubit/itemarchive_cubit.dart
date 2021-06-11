import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mysli/model/archived_item.dart';

part 'itemarchive_state.dart';

class ItemarchiveCubit extends Cubit<ItemarchiveState> with HydratedMixin {
  ItemarchiveCubit() : super(ItemarchiveState(items: List<ArchivedItem>.filled(1, ArchivedItem(name: "Long press suggestions to delete"), growable: true)));

  List<ArchivedItem> getFiltered(String filter) {
    return state.items.where((item) {
      return item.name.toLowerCase().trim().contains(filter.toLowerCase().trim());
    }).toList();
  }

  ArchivedItem getItemByName(String name) {
    return state.items.firstWhere(
      (e) => e.name.trim() == name.trim(),
      orElse: () => null,
    );
  }

  void changeCategory(int index, String category) {
    List<ArchivedItem> newList = [...state.items];
    newList[index] = newList[index].copyWith(category: category);
    emit(ItemarchiveState(items: newList));
  }

  void addItem(ArchivedItem newItem) {
    emit(ItemarchiveState(items: [...state.items, newItem]));
  }

  void deleteItem(String name) {
    emit(ItemarchiveState(items: [...state.items].where((e) => e.name != name).toList()));
  }

  // Generated methods
  @override
  ItemarchiveState fromJson(Map<String, dynamic> json) {
    return ItemarchiveState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(ItemarchiveState state) {
    return state.toMap();
  }
}
