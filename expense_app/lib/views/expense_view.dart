import 'package:expense_app/data/expenses_data.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  List<Expense> expenses = ExpensesData().expenses;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return ExpenseItem(expenses: expenses, index: index);
            },
          ))
        ],
      ),
    );
  }
}
