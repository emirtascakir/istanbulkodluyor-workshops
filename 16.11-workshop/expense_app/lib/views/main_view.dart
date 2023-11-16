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
                      return NewExpense(callback: () {
                        _MainViewState().build(context);
                      });
                    });
              },
              icon: const Icon(
                Icons.add,
                size: 34,
              ))
        ],
      ),
      body: const ExpenseView(),
    );
  }
}
