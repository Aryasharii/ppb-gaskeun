import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int totalAmount;
  final int deliveryCost;
  final String paymentMethod;

  OrderDetailScreen({
    required this.items,
    required this.totalAmount,
    required this.deliveryCost,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order Summary'),
        backgroundColor: Color(0xFF66B2B2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Menampilkan daftar item yang dipesan
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                // Menghitung total price per item
                int totalPrice = item['quantity'] * item['price'];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(
                      'Quantity: ${item['quantity']}, Total: Rp. $totalPrice'),
                );
              },
            ),
            SizedBox(height: 20),
            // Menampilkan total amount, biaya pengiriman, dan total keseluruhan
            buildSummaryRow('Total Amount', 'Rp. $totalAmount'),
            buildSummaryRow('Delivery Cost', 'Rp. $deliveryCost'),
            buildSummaryRow(
              'Total Payment',
              'Rp. ${totalAmount + deliveryCost}',
              isTotal: true,
            ),
            SizedBox(height: 20),
            // Menampilkan metode pembayaran
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              paymentMethod,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  // Metode untuk membangun baris ringkasan dengan label dan nilai
  Widget buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 18,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 18,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
