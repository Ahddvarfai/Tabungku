import 'package:get/get.dart';
import '../models/transaction.dart';

class TransactionController extends GetxController {
  final RxList<SavingsTransaction> transactions = <SavingsTransaction>[
    SavingsTransaction(
      id: '1',
      name: 'Uang saku',
      amount: 500000,
      type: TransactionType.income,
      date: DateTime.now(),
    ),
    SavingsTransaction(
      id: '2',
      name: 'Membeli buku',
      amount: 75000,
      type: TransactionType.expense,
      date: DateTime.now(),
    ),
  ].obs;

  double get totalIncome => transactions
      .where((item) => item.type == TransactionType.income)
      .fold(0.0, (sum, item) => sum + item.amount);

  double get totalExpense => transactions
      .where((item) => item.type == TransactionType.expense)
      .fold(0.0, (sum, item) => sum + item.amount);

  double get balance => totalIncome - totalExpense;

  void addTransaction({
    required String name,
    required double amount,
    required TransactionType type,
  }) {
    transactions.insert(
      0,
      SavingsTransaction(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name.trim(),
        amount: amount,
        type: type,
        date: DateTime.now(),
      ),
    );
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((item) => item.id == id);
  }
}
