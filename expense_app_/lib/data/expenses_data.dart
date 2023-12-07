import 'package:expense_app/models/expense_model.dart';

class ExpensesData {
  List<Expense> expenses = [
    Expense(name: "Kargo", price: 55, date: DateTime.now()),
    Expense(name: "Akşam yemeği", price: 360, date: DateTime.now()),
    Expense(name: "Benzin", price: 50, date: DateTime.now()),
    Expense(name: "Kitap alışverişi", price: 295, date: DateTime.now()),
    Expense(name: "Telefon faturası", price: 225, date: DateTime.now()),
    Expense(name: "Kahve", price: 60, date: DateTime.now()),
  ];
}
