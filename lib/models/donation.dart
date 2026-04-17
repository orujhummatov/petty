class Donation {
  const Donation({
    required this.id,
    required this.donor,
    required this.amount,
    required this.date,
  });

  final String id;
  final String donor;
  final double amount;
  final DateTime date;
}
