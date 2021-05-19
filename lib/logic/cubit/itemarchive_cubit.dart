import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mysli/model/archived_item.dart';
import 'package:mysli/model/item.dart';

part 'itemarchive_state.dart';

class ItemarchiveCubit extends Cubit<ItemarchiveState> {
  ItemarchiveCubit() : super(ItemarchiveState(items: List<ArchivedItem>.filled(1, ArchivedItem(name: "Banana"), growable: true))); // TODO: Remove default item

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

  void addItem(ArchivedItem newItem) {
    emit(ItemarchiveState(items: [...state.items, newItem]));
  }
}
