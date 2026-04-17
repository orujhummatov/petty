class Expense {
  const Expense({
    required this.id,
    required this.amount,
    required this.purpose,
    required this.date,
    required this.category,
    required this.proofUrl,
  });

  final String id;
  final double amount;
  final String purpose;
  final DateTime date;
  final String category;
  final String proofUrl;
}
