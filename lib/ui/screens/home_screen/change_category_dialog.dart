import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/category_cubit.dart';
import 'package:mysli/logic/cubit/itemarchive_cubit.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';

Future<bool> changeCategoryDialog(BuildContext context, int index) async {
  final itemlistCubit = BlocProvider.of<ItemlistCubit>(context, listen: false);
  final itemarchiveCubit = BlocProvider.of<ItemarchiveCubit>(context, listen: false);

  void _handleCategoryChange(String category) {
    itemlistCubit.changeCategory(index, category);
    itemarchiveCubit.changeCategory(index, category);
  }

  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider<CategoryCubit>(
        create: (context) => CategoryCubit(),
        child: SimpleDialog(
          title: const Text('Change category'),
          // TODO: Fetch categories from CategoryCubit
          children: <String>['A', 'B', 'C', 'D'].map((String category) {
            return ListTile(
              title: Text("Category " + category),
              onTap: () {
                _handleCategoryChange(category);
                Navigator.of(context).pop();
              },
              // TODO: On long tap: delete category
              contentPadding: const EdgeInsets.symmetric(horizontal: 32),
            );
          }).toList(),
          // TODO: Button to create new category
          // 👆 if new category, also add it to CategoryCubit
        ),
      );
    },
  );
}
