import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../models/transaction.dart';

class TransactionDetailPage extends StatelessWidget {
  final String transactionId;
  const TransactionDetailPage({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaksi')),
      body: Obx(() {
        final matches = controller.transactions
            .where((item) => item.id == transactionId);
        if (matches.isEmpty) {
          return const Center(child: Text('Transaksi tidak ditemukan.'));
        }

        final item = matches.first;
        final isIncome = item.type == TransactionType.income;
        final date = item.date;
        final dateText =
            '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        isIncome ? Icons.south_west : Icons.north_east,
                        size: 48,
                        color: isIncome ? Colors.green : Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isIncome ? '+' : '-'}${formatRupiah(item.amount)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: isIncome ? Colors.green : Colors.red,
                        ),
                      ),
                      const Divider(height: 32),
                      _detailRow('Jenis', isIncome ? 'Pemasukan' : 'Pengeluaran'),
                      _detailRow('Tanggal', dateText),
                      _detailRow('ID transaksi', item.id),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Hapus transaksi?'),
                              content: const Text(
                                  'Transaksi ini akan dihapus dari riwayat.'),
                              actions: [
                                TextButton(
                                  onPressed: Get.back,
                                  child: const Text('Batal'),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    controller.deleteTransaction(item.id);
                                    Get.back();
                                    Get.back();
                                  },
                                  child: const Text('Hapus'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Hapus transaksi'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 12),
          Flexible(
            child: Text(value, textAlign: TextAlign.end,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
