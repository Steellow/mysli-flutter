import 'package:flutter/material.dart';

class ListViewItemBg extends StatelessWidget {
  const ListViewItemBg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using ListTile as bg because the size is a perfect match.
    return ListTile(
      tileColor: Colors.red,
      leading: Icon(Icons.remove),
      trailing: Icon(Icons.add),
    );
  }
}
