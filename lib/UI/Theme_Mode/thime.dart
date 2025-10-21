import 'package:flutter/material.dart';

final ThemeData LightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.light),
  useMaterial3: true,
);

final ThemeData DarkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.dark),
  useMaterial3: true,
);
