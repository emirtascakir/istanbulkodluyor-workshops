import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ExpenseView extends StatefulWidget {
  ExpenseView(this.expenses, this.onUndo, this.onRemove, {super.key});
  List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  final void Function(Expense expense) onUndo;

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Chart(allExpenses: widget.expenses),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.expenses.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(widget.expenses[index]),
                child: Card(
                  child: ListTile(
                    leading: Text(
                      DateFormat.yMd().format(widget.expenses[index].date),
                      style: const TextStyle(fontSize: 14),
                    ),
                    title: Text(
                      widget.expenses[index].name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      "${widget.expenses[index].price}₺",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    widget.onRemove(widget.expenses[index]);
                    final snackBar = SnackBar(
                        content: const Text("Silme İşlemi Başarılı"),
                        action: SnackBarAction(
                            label: "Geri Al",
                            onPressed: () {
                              widget.onUndo(widget.expenses[index]);
                            }));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
