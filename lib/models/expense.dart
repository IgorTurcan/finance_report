class Expense {
  final DateTime date;
  final String name;
  final double price;
  final double quantity;
  final String unit;
  final String category;
  final String? provider;

  Expense({
    required this.name,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.category,
    required this.provider,
  }) : date = DateTime.now();

  List<String> toList() {
    return [
      date.toString(),
      name,
      price.toString(),
      quantity.toString(),
      unit,
      category,
      if (provider != null) provider!
    ];
  }
}
