import 'package:expense_app/views/main_view.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 157, 194, 212));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme1,
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme1.primary,
            foregroundColor: colorScheme1.primaryContainer),
        cardTheme: CardTheme(
            color: colorScheme1.onSecondary,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    ),
  );
}
