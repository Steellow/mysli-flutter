# Mysli

Mysli (=My Shopping List) is a free and open source shopping list app. I didn't find a good one which met all my requirements so I made this.

## Ideas (a.k.a. todo)

- General
  - Use generated routes
- List view
  - Disable trash can button when none ticked
  - Show nice icon when empty
  - Grouped list package?
  - Suggestions
    - Press & hold suggestion to delete it
    - Add HydratedMixin
  - Categories
  - Add +1 amount if item is already in the list
  - Change swipeable to buttons
    - Easier to customize and maintain
- Settings
  - Sort categories
- Extra stuff
  - Save presets for foods
- Release
  - Add vibration to android manifest
- Investigate:
  - ListViewItem: BlocBuilder builder function called twice after TextFieldSubmit
    - Doesn't happen if selecting suggestion
- Documentaion
  - Write about different blocs

## Stuff I've learned

- BLoC
- Immutable objects are faster to compare

## Notes for myself

- Swipeable ListTiles aren't as satisfying as I thought they would be. Might change it to something different.
