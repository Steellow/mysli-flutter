import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysli/util/styles.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Empty list!",
          style: Styles.emptyCartText,
          textAlign: TextAlign.center,
        ),
        Container(
          height: 24,
        ),
        Opacity(
          opacity: 0.8,
          child: SvgPicture.asset(
            'images/Character_zombieing.svg',
            semanticsLabel: 'Empty cart',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      ],
    );
  }
}
