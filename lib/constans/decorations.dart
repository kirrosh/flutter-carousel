import 'package:flutter/material.dart';

List<Color> _colors = [
  Color.fromARGB(255, 228, 226, 213),
  Color.fromARGB(255, 250, 247, 233)
];

final mainBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(colors: _colors),
);
