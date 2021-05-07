import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/item.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Add items',
        ),
        onSubmitted: (value) {
          BlocProvider.of<ItemlistCubit>(context).addItem(Item(name: value));
          _controller.clear();
        },
      ),
    );
  }
}
