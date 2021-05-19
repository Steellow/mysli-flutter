import 'package:flutter/material.dart';

Future<bool> confirmDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete suggestion?'),
        actions: <Widget>[
          TextButton(
            child: Text('Nah'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Yep'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
