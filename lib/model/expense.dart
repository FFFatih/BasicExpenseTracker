import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


final formatter = DateFormat.yMd();
   // tarih formatını gün/ay/yıl saat:dakika olarak döndürüyor

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); //uuid ile v4 metodu kullanılarak id benzersiz bir şekilde oluşturuluyor
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

 String get formattedDate {
    return formatter.format(date);
     // tarih formatını gün/ay/yıl saat:dakika olarak döndürüyor
  } // tarih formatını gün/ay/yıl olarak döndürüyor

}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0.0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
    // expenses listesindeki tüm harcamaların toplamını hesaplar
  }
}