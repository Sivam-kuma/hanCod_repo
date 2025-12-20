class Cleaning {
  final int id;
  final String name;
  final int quantity;
  final int amount;
  final double rating;


  Cleaning({
    required this.id,
    required this.name,
    required this.quantity,
    required this.amount,
    required this.rating,
  });

  factory Cleaning.fromJson(Map<String, dynamic> json) {
    return Cleaning(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      amount: json['amount'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
