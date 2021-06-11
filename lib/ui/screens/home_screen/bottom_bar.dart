import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysli/logic/cubit/itemarchive_cubit.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/model/archived_item.dart';
import 'package:mysli/model/item.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mysli/ui/widgets/confirm_dialog.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  TextEditingController _controller = TextEditingController();

  void _onTextFieldSubmit(String inputValue) {
    // Context is available here because this is stateful widget

    inputValue = inputValue.trim();

    ArchivedItem archivedItem = BlocProvider.of<ItemarchiveCubit>(context).getItemByName(inputValue);
    if (archivedItem == null) {
      BlocProvider.of<ItemarchiveCubit>(context).addItem(ArchivedItem(name: inputValue));
    }

    BlocProvider.of<ItemlistCubit>(context).addItem(Item(name: archivedItem?.name ?? inputValue));
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
        itemBuilder: (_, suggestion) {
          // Tried to make seperate widget for item suggestion,
          // but ItemarchiveCubit wasn't available there.
          // Also the underscore parameter is supposed to be context
          // but we want to use old context here to access the cubit.
          // We could just use new BlocProvider but not worth imo.
          return ListTile(
            onLongPress: () async {
              if (await confirmDialog(context) ?? false) {
                print("Deleting item " + suggestion.name);
                BlocProvider.of<ItemarchiveCubit>(context).deleteItem(suggestion.name);
              }
            },
            title: Text(suggestion.name),
          );
        },
      ),
    );
  }
}
