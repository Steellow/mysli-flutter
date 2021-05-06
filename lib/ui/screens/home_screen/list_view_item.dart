import 'package:flutter/material.dart';

class ListViewItem extends StatefulWidget {
  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text("This is a test!"),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
