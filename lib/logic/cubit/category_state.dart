part of 'category_cubit.dart';

class CategoryState {
  List<String> categories;

  CategoryState({
    @required this.categories,
  });

  // Generated methods
  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
    };
  }

  factory CategoryState.fromMap(Map<String, dynamic> map) {
    return CategoryState(
      categories: List<String>.from(map['categories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryState.fromJson(String source) => CategoryState.fromMap(json.decode(source));
}
