class Order {
  final int orderId;
  final List<Map<String, dynamic>> items;
  final int totalAmount;
  final int deliveryCost;
  String status;
  String paymentMethod; // Tambahkan properti paymentMethod

  Order({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.deliveryCost,
    required this.status,
    required this.paymentMethod, // Inisialisasi properti paymentMethod di konstruktor
  });
}
