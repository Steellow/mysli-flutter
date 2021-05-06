import 'package:flutter/material.dart';
import 'package:mysli/ui/screens/home_screen/bottom_bar.dart';
import 'package:mysli/ui/screens/home_screen/list_view_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mysli"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListViewItem(),
                ListViewItem(),
                ListViewItem(),
              ],
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
