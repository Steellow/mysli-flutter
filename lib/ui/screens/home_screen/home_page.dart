import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemarchive_cubit.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/ui/screens/home_screen/bottom_bar.dart';
import 'package:mysli/ui/screens/home_screen/home_app_bar.dart';
import 'package:mysli/ui/screens/home_screen/list_view_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ItemlistCubit, ItemlistState>(
              buildWhen: (oldState, newState) {
                if (oldState.items.length == newState.items.length) return false;
                return true;
              },
              builder: (context, state) {
                print("home_page.dart: BlocBuilder builder function called");
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListViewItem(index: index);
                  },
                );
              },
            ),
          ),
          BlocProvider(
            create: (context) => ItemarchiveCubit(),
            child: BottomBar(),
          ),
        ],
      ),
    );
  }
}
