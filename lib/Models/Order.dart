class Order {
  final int orderId;
  final List<Map<String, dynamic>> items;
  final int totalAmount;
  final int deliveryCost;
  String status;

  Order({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.deliveryCost,
    this.status = 'Pending', // Default status is 'Pending'
  });

  // Factory method to create Order from JSON data
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      items: List<Map<String, dynamic>>.from(json['items']),
      totalAmount: json['totalAmount'],
      deliveryCost: json['deliveryCost'],
      status: json['status'] ?? 'Pending',
    );
  }

  // Convert Order to JSON data
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'items': items,
      'totalAmount': totalAmount,
      'deliveryCost': deliveryCost,
      'status': status,
    };
  }
}
