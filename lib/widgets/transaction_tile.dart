import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final SavingsTransaction transaction;
  final VoidCallback onTap;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    final date = transaction.date;
    final dateText =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: isIncome ? Colors.green.shade50 : Colors.red.shade50,
          child: Icon(
            isIncome ? Icons.arrow_downward : Icons.arrow_upward,
            color: isIncome ? Colors.green : Colors.red,
          ),
        ),
        title: Text(transaction.name,
            maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(dateText),
        trailing: Text(
          '${isIncome ? '+' : '-'}${formatRupiah(transaction.amount)}',
          style: TextStyle(
            color: isIncome ? Colors.green.shade700 : Colors.red.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
