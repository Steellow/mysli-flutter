import 'package:flutter/material.dart';
import 'package:mysli/ui/screens/home_screen/list_view_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mysli"),
      ),
      body: ListView(
        children: [
          ListViewItem(),
          ListViewItem(),
          ListViewItem(),
        ],
      ),
    );
  }
}
