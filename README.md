# Mysli

Mysli (=My Shopping List) is a free and open source shopping list app. I didn't find a good one which met all my requirements so I made this.

## Ideas (a.k.a. todo)

- General
  - Use generated routes
- List view
  - Disable trash can button when none ticked
  - Suggestions
    - Add HydratedMixin
  - Categories
    - Grouped list package?
      - Delete vibration package
  - Add +1 amount if item is already in the list
  - **Change swipeable to buttons**
    - Easier to customize and maintain
- Settings
  - Sort categories
- Extra stuff
  - Save presets for foods
- Investigate:
  - ListViewItem: BlocBuilder builder function called twice after TextFieldSubmit
    - Doesn't happen if selecting suggestion
  - ````Note: C:\src\flutter.pub-cache\hosted\pub.dartlang.org\flutter_keyboard_visibility-5.0.2\android\src\main\java\com\jrai\flutter_keyboard_visibility\FlutterKeyboardVisibilityPlugin.java uses or overrides a deprecated API.
        Note: Recompile with -Xlint:deprecation for details.```
    ````
- Documentaion
  - Write about different blocs

## Stuff I've learned

- BLoC
- Immutable objects are faster to compare

## Notes for myself

- Swipeable ListTiles aren't as satisfying as I thought they would be. Might change it to something different.
- Empty screen illustration is from https://www.opendoodles.com/
