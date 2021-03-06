import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/item.dart';
import 'package:mysli/ui/screens/home_screen/change_category_dialog.dart';

class ListViewItem extends StatelessWidget {
  final int index;

  const ListViewItem({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemlistCubit, ItemlistState>(
      buildWhen: (oldState, newState) {
        if (index >= newState.items.length) {
          // Comparing item at index which doesn't exist results in errors, so first we check if there is an item in that index
          return false;
        } else if (oldState.items[index] == newState.items[index]) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        print("ListViewItem: BlocBuilder builder function called");
        Item item = state.items[index];
        return Slidable(
          child: CheckboxListTile(
            tileColor: Theme.of(context).canvasColor, // Defaults to transparent and would see background row
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    decoration: item.ticked ? TextDecoration.lineThrough : null,
                    color: item.ticked ? Colors.grey : null,
                  ),
                ),
                Text(
                  // item.amount.toString(),
                  item.category,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            value: item.ticked,
            onChanged: (bool newValue) {
              BlocProvider.of<ItemlistCubit>(context).tickItem(index, newValue);
            },
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.125,
          actions: [
            IconSlideAction(
              color: Colors.red[300],
              icon: Icons.category,
              onTap: () => changeCategoryDialog(context, index),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Colors.red[400],
              icon: Icons.remove,
              onTap: () => BlocProvider.of<ItemlistCubit>(context).changeAmount(index, -1),
            ),
            IconSlideAction(
              color: Colors.green[400],
              iconWidget: Icon(Icons.add, color: Colors.white),
              onTap: () => BlocProvider.of<ItemlistCubit>(context).changeAmount(index, 1),
            ),
          ],
        );
      },
    );
  }
}
