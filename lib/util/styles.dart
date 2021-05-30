import 'package:flutter/material.dart';

class Styles {
  ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        toggleableActiveColor: Colors.red, // Checkbox when ticked
        accentColor: Colors.red, // TextField border
      );

  static const TextStyle emptyCartText = TextStyle(
    fontSize: 20,
  );
}
