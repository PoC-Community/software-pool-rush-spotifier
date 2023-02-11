import 'package:flutter/material.dart';

TextTheme _textTheme = const TextTheme(
  bodyMedium: TextStyle(
    color: Colors.white,
  ),
);

ThemeData _myTheme = ThemeData(
  primaryColor: const Color(0xff1DB954),
  hoverColor: const Color.fromARGB(255, 18, 117, 53),
  primaryColorLight: const Color.fromARGB(255, 182, 179, 179),
  primaryColorDark: const Color(0xff191414),
  canvasColor: const Color(0xff191414),
  cardColor: const Color.fromARGB(255, 31, 31, 31),
  splashColor: const Color.fromARGB(255, 223, 238, 18),
  unselectedWidgetColor: const Color.fromARGB(255, 104, 102, 102),
  textTheme: _textTheme,
  iconTheme: const IconThemeData(color: Colors.white),
);

ThemeData get mainTheme {
  return _myTheme;
}
