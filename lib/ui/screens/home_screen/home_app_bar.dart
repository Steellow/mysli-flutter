import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56);
  // For somer reason, if AppBar is seperate widget it has to be this preferredSize thing. Default is 56.
  // See: https://stackoverflow.com/q/52678469

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Mysli"),
      actions: [
        BlocBuilder<ItemlistCubit, ItemlistState>(
          buildWhen: (oldState, newState) {
            if (oldState.items.length == newState.items.length) return false;
            return true;
          },
          builder: (context, state) {
            return IconButton(
              icon: const Icon(Icons.delete),
              tooltip: "Delete ticked items",
              onPressed: state.items.length > 0
                  ? () {
                      BlocProvider.of<ItemlistCubit>(context).deleteTicked();
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
