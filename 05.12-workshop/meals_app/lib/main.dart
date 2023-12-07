import 'package:flutter/material.dart';
import 'package:meals_app/views/category_view.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 255, 00),
      brightness: Brightness.dark,
    ));
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme,
    home: const CategoryView(),
  ));
}
