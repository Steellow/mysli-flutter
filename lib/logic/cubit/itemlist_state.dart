part of 'itemlist_cubit.dart';

class ItemlistState {
  List<Item> items;

  ItemlistState({
    @required this.items,
  });

  // Generated methods
  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ItemlistState.fromMap(Map<String, dynamic> map) {
    return ItemlistState(
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemlistState.fromJson(String source) => ItemlistState.fromMap(json.decode(source));
}
