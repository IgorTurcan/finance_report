class Expense {
  final DateTime date;
  final String name;
  final int prince;
  final int quantity;
  final String unit;
  final String category;
  final String provider;

  Expense({
    required this.name,
    required this.prince,
    required this.quantity,
    required this.unit,
    required this.category,
    required this.provider,
  }) : date = DateTime.now();
}
