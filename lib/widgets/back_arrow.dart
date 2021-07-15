import 'package:flutter/material.dart';
import 'package:salon/configs/app_globals.dart';

/// Creates a custom Back Arrow
///
/// E.g
/// ```dart
/// BackArrow();
/// ```
class BackArrow extends StatelessWidget {
  final Color arrowColor;

  BackArrow({@required this.arrowColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: arrowColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
