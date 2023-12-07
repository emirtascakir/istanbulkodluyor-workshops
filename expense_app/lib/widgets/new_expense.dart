import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAdd;
  const NewExpense(this.onAdd, {super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceController = TextEditingController();
  Category _selectedCategory = Category.work;
  DateTime _selectedDate =
      DateTime.now(); // initialize selected date to current date

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(
          const Duration(days: 365)), // restrict dates to last year and beyond
      lastDate: DateTime.now(), // only allow dates up to today
      selectableDayPredicate: (DateTime day) {
        return day.isBefore(DateTime.now()
            .add(const Duration(days: 1))); // only allow dates before tomorrow
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 66, 66, 66),
                    size: 30,
                  ),
                ),
                const Text(
                  "Yeni Giderlerinizi Ekleyin",
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Expense newExpense = Expense(
                      name: _expenseNameController.text,
                      price: double.parse(_expensePriceController.text),
                      date: _selectedDate,
                      category: _selectedCategory,
                    );
                    widget.onAdd(newExpense);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ekle",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 66, 66, 66)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: TextField(
                controller: _expenseNameController,
                decoration: const InputDecoration(
                  labelText: "Harcamanızın Adı",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _expensePriceController,
                decoration: const InputDecoration(
                  labelText: "Harcamanızın Tutarı",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _selectDate,
                  child: Text(
                    "Tarih Seçin: " +
                        DateFormat('yyyy-MM-dd').format(_selectedDate),
                    style:
                        const TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                  ),
                ),
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                          value: category, child: Text(category.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedCategory = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
