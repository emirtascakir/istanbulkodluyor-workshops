import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses, required this.index});

  final List<Expense> expenses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        DateFormat.yMd().format(expenses[index].date),
        style: const TextStyle(fontSize: 14),
      ),
      title: Text(
        expenses[index].name,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        "${expenses[index].price}₺",
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
