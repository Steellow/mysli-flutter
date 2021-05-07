import 'package:flutter/material.dart';
import 'package:mysli/model/item.dart';

class ListViewItem extends StatefulWidget {
  final Item item;

  const ListViewItem({Key key, @required this.item}) : super(key: key);

  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.item.name),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
