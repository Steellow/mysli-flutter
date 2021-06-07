part of 'itemarchive_cubit.dart';

class ItemarchiveState {
  List<ArchivedItem> items;

  ItemarchiveState({
    @required this.items,
  });

  // Generated methods
  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ItemarchiveState.fromMap(Map<String, dynamic> map) {
    return ItemarchiveState(
      items: List<ArchivedItem>.from(map['items']?.map((x) => ArchivedItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemarchiveState.fromJson(String source) => ItemarchiveState.fromMap(json.decode(source));
}
