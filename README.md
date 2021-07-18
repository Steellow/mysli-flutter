# Mysli

Mysli (=My Shopping List) is a free and open source shopping list app. I didn't find a good one which met all my requirements so I made this.

## Ideas (a.k.a. todo)

- General
  - Use generated routes
  - Enable null-safety
- List view
  - Categories
    - [grouped_list](https://pub.dev/packages/grouped_list) package?
    - Update architecture
    - Dialog
      - Create new categories
      - Delete categories
  - Add +1 amount if item is already in the list
- Settings
  - Manage categories
    - Get instance of CategoryCubit with generated routes
    - Change category order
    - Delete categories
- Investigate:
  - ListViewItem: BlocBuilder builder function called twice after TextFieldSubmit
    - Doesn't happen if selecting suggestion
  - ````Note: C:\src\flutter.pub-cache\hosted\pub.dartlang.org\flutter_keyboard_visibility-5.0.2\android\src\main\java\com\jrai\flutter_keyboard_visibility\FlutterKeyboardVisibilityPlugin.java uses or overrides a deprecated API.
        Note: Recompile with -Xlint:deprecation for details.```
    ````
- Release
  - App icon
  - Correct package name

## Architecture

- State management: **Bloc**
  - All blocs/cubits have HydratedMixin to persist state
    - HydratedMixin uses Hive underhood thus should be super fast
  - Different cubits:
    - **Itemlist_cubit**
      - Holds list of Item objcts
      - This is the main cubit which remembers current items in list
    - **Itemarchive_cubit**
      - Holds list of ArchivedItems objects
      - List of all items ever added to the list
      - Item suggestions are fetched from here when typing on the bottom bar
      - ArchivedItems can be deleted by long-pressing the suggestion
    - **Category_cubit**
      - List of known categories
- Models
  - **Item**
    - Regular, single item in the list
  - **ArchivedItem**
    - Items which have been added to the list at some point
    - Stores name and category
    - Are converted to regular items when added to list

## Stuff I've learned

- BLoC
- Immutable objects are faster to compare
- [AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html) is for informing the user, [SimpleDialog](https://api.flutter.dev/flutter/material/SimpleDialog-class.html) is for showing options

## Notes for myself

- Empty screen illustration is from https://www.opendoodles.com/
- Debug build has `.debug` prefix in package name
  - Allows both debug and release build on the same device
  - [Relevant](https://hanki.bearblog.dev/4/)
