import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/item.dart';
import 'package:mysli/ui/screens/home_screen/list_view_item_bg.dart';
import 'package:swipeable/swipeable.dart';
import 'package:vibration/vibration.dart';

class ListViewItem extends StatelessWidget {
  final int index;

  const ListViewItem({Key key, @required this.index}) : super(key: key);

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 60);
    }
  }

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
        return Swipeable(
          onSwipeLeft: () {
            _vibrate();
            BlocProvider.of<ItemlistCubit>(context).changeAmount(index, 1);
          },
          onSwipeRight: () {
            _vibrate();
            BlocProvider.of<ItemlistCubit>(context).changeAmount(index, -1);
          },
          background: ListViewItemBg(),
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
                  item.amount.toString(),
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
        );
      },
    );
  }
}
