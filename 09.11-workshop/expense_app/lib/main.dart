import 'package:expense_app/views/expense_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expense App",
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[400],
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 34,
                ))
          ],
        ),
        body: const ExpenseView(),
      ),
    ),
  );
}
