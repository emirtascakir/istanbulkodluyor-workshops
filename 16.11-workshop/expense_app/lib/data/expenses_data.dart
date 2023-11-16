import 'package:expense_app/models/expense_model.dart';

class ExpensesData {
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
    Expense(
      name: "Kitap alışverişi",
      price: 295,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      name: "Telefon faturası",
      price: 225,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      name: "Kahve",
      price: 60,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: "Su",
      price: 5,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void addExpense(Expense expense) {
    expenses.add(expense);
  }
}
