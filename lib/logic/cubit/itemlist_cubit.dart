import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mysli/model/item.dart';

part 'itemlist_state.dart';

class ItemlistCubit extends Cubit<ItemlistState> {
  ItemlistCubit() : super(ItemlistState(items: List<Item>.filled(1, Item(name: "test"), growable: true)));

  void addItem(Item newItem) {
    List<Item> listWithNewItem = [...state.items, newItem];
    emit(ItemlistState(items: listWithNewItem));
  }
}
