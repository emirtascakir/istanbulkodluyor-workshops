import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  List<Expense> expenses = [
    Expense(name: "Kargo", price: 55, date: DateTime.now()),
    Expense(name: "Akşam yemeği", price: 360, date: DateTime.now()),
    Expense(name: "Benzin", price: 50, date: DateTime.now()),
    Expense(name: "Kitap alışverişi", price: 295, date: DateTime.now()),
    Expense(name: "Telefon faturası", price: 225, date: DateTime.now()),
    Expense(name: "Kahve", price: 60, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
            shrinkWrap: false,
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.call_missed_outgoing_rounded,
                    color: Colors.red[700], size: 30),
                title: Text(
                  expenses[index].name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    expenses[index].price.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.currency_lira_rounded,
                    color: Colors.black,
                    size: 24,
                  )
                ]),
              );
            },
          ))
        ],
      ),
    );
  }
}
