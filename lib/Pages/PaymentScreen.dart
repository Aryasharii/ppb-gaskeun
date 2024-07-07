import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _paymentMethod = 'Card'; // Default payment method

  @override
  Widget build(BuildContext context) {
    // Mendapatkan data order dari arguments
    final Map<String, dynamic>? orderDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (orderDetails == null ||
        !orderDetails.containsKey('items') ||
        !orderDetails.containsKey('totalAmount') ||
        !orderDetails.containsKey('deliveryCost')) {
      // Menampilkan halaman error jika data tidak lengkap
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Text('Error: Invalid order details.'),
        ),
      );
    }

    final List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(orderDetails['items']);
    final int totalAmount = orderDetails['totalAmount'];
    final int deliveryCost = orderDetails['deliveryCost'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
            // Menampilkan opsi pembayaran
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Dropdown untuk memilih metode pembayaran
            DropdownButtonFormField<String>(
              value: _paymentMethod,
              onChanged: (String? value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
              items: <String>['Card', 'Cash On Delivery']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Tombol untuk kembali ke halaman sebelumnya dan tombol untuk proses pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    backgroundColor: Color.fromARGB(255, 205, 205, 205),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Tampilkan dialog pembayaran berhasil
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Payment Successful'),
                        content: Text('Thank you for your order!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/myOrders');
                            },
                            child: Text('View Orders'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName('/'), // Kembali ke halaman utama
                              );
                            },
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Pay Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    backgroundColor: Color(0xFF66B2B2),
                  ),
                ),
              ],
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
