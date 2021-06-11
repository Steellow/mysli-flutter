import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mysli/util/const.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> with HydratedMixin {
  CategoryCubit() : super(CategoryState(categories: List<String>.filled(1, UNCATEGORIZED, growable: true)));

  void addCategory(String newCategory) {
    emit(CategoryState(categories: [...state.categories, newCategory]));
  }

  // Generated methods
  @override
  CategoryState fromJson(Map<String, dynamic> json) {
    return CategoryState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CategoryState state) {
    return state.toMap();
  }
}
