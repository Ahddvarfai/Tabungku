import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/balance_card.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_tile.dart';
import 'transaction_form_page.dart';
import 'transaction_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabungku',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => const TransactionFormPage()),
        icon: const Icon(Icons.add),
        label: const Text('Tambah transaksi'),
      ),
      body: SafeArea(
        child: Obx(() {
          final items = controller.transactions.toList();
          return LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 650;
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BalanceCard(balance: controller.balance),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: SummaryCard(
                                title: 'Pemasukan',
                                amount: controller.totalIncome,
                                icon: Icons.south_west,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SummaryCard(
                                title: 'Pengeluaran',
                                amount: controller.totalExpense,
                                icon: Icons.north_east,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        const Text('Riwayat Transaksi',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        if (items.isEmpty)
                          const Card(
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(24),
                              child: Center(
                                  child: Text('Belum ada transaksi.')),
                            ),
                          )
                        else
                          ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return TransactionTile(
                                transaction: item,
                                onTap: () => Get.to(
                                  () => TransactionDetailPage(
                                      transactionId: item.id),
                                ),
                              );
                            },
                          ),
                        if (wide) const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
