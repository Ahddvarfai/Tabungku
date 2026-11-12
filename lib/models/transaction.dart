enum TransactionType { income, expense }

class SavingsTransaction {
  final String id;
  final String name;
  final double amount;
  final TransactionType type;
  final DateTime date;

  const SavingsTransaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });
}

String formatRupiah(num amount) {
  final value = amount.round().toString();
  final result = StringBuffer();
  for (int i = 0; i < value.length; i++) {
    result.write(value[i]);
    final remaining = value.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) result.write('.');
  }
  return 'Rp$result';
}
