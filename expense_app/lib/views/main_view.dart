import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/views/expense_view.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Expense> expenses = [
    Expense(
        name: "Kargo",
        price: 55,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: "Akşam yemeği",
        price: 360,
        date: DateTime.now(),
        category: Category.food),
    Expense(
      name: "Benzin",
      price: 50,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  List<Expense> removedExpens = [];

  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    setState(() {
      removedExpens.add(expense);
      expenses.remove(expense);
    });
  }

  undoExpense(Expense expense) {
    setState(() {
      addExpense(removedExpens.last);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense App",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addExpense);
                    });
              },
              icon: const Icon(
                Icons.add,
                size: 34,
              ))
        ],
      ),
      body: ExpenseView(expenses, undoExpense, removeExpense),
    );
  }
}
