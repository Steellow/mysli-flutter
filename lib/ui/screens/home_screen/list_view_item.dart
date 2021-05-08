import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/item.dart';

class ListViewItem extends StatefulWidget {
  final int index;

  const ListViewItem({Key key, @required this.index}) : super(key: key);

  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemlistCubit, ItemlistState>(
      buildWhen: (oldState, newState) {
        if (widget.index >= newState.items.length) {
          // Comparing item at index which doesn't exist results in errors, so first we check if there is an item in that index
          return false;
        } else if (oldState.items[widget.index] == newState.items[widget.index]) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        print("ListViewItem: BlocBuilder builder function called");
        Item item = state.items[widget.index];
        return CheckboxListTile(
          title: Text(
            item.name,
            style: TextStyle(
              decoration: item.checked ? TextDecoration.lineThrough : null,
              color: item.checked ? Colors.grey : null,
            ),
          ),
          value: item.checked,
          onChanged: (bool newValue) {
            setState(() {
              BlocProvider.of<ItemlistCubit>(context).tickItem(widget.index, newValue);
            });
          },
        );
      },
    );
  }
}
