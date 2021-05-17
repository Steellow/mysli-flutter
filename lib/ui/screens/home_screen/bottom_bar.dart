import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemarchive_cubit.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/archived_item.dart';
import 'package:mysli/model/item.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  TextEditingController _controller = TextEditingController();

  void _onTextFieldSubmit(String value) {
    // Context is available here because this is stateful widget
    BlocProvider.of<ItemlistCubit>(context).addItem(Item(name: value));
    BlocProvider.of<ItemarchiveCubit>(context).addItem(ArchivedItem(name: value));
    _controller.clear();
  }

  void _onSuggestionSelect(ArchivedItem suggestion) {
    // TODO: When selecting suggestion, also add correct category to the new item
    BlocProvider.of<ItemlistCubit>(context).addItem(Item(name: suggestion.name));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TypeAheadField<ArchivedItem>(
        onSuggestionSelected: _onSuggestionSelect,
        textFieldConfiguration: TextFieldConfiguration(
          onSubmitted: _onTextFieldSubmit,
          controller: _controller,
          textInputAction: TextInputAction.go,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Add items',
          ),
        ),

        hideOnEmpty: true,
        hideOnLoading: true, // If false causes ugly visual glitch on keyboard open
        debounceDuration: Duration(milliseconds: 0), // No timer to keep it snappy (Add timer is performance suffers?)
        animationDuration: Duration(milliseconds: 0), // Disabling animation since it always reanimated the whole list, even if the results were same
        direction: AxisDirection.up,
        suggestionsCallback: (pattern) {
          if (pattern.length > 0) {
            return BlocProvider.of<ItemarchiveCubit>(context).getFiltered(pattern);
          }
          return null;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            // TODO: Long press to delete suggestion (also seperate widget?)
            title: Text(suggestion.name),
          );
        },
      ),
    );
  }
}
