import 'package:flutter/material.dart';
import '../models/transaction.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF167D68),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Saldo Tabungan',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            Text(
              formatRupiah(balance),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Icon(Icons.savings_outlined, color: Colors.white70),
                SizedBox(width: 8),
                Text('Kelola tabunganmu dengan mudah',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
