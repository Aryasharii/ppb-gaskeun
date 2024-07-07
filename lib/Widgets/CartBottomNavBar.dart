import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  final int totalAmount;
  final List<Map<String, dynamic>> itemsList;
  final int deliveryCost;

  CartBottomNavBar({
    required this.totalAmount,
    required this.itemsList,
    required this.deliveryCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total: Rp. $totalAmount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF31B6B2),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Delivery Cost: Rp. $deliveryCost',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke PaymentScreen dan kirimkan data yang diperlukan
              Navigator.pushNamed(
                context,
                '/payment',
                arguments: {
                  'totalAmount': totalAmount,
                  'itemsList': itemsList, // Ubah 'items' menjadi 'itemsList'
                  'deliveryCost': deliveryCost,
                },
              );
            },
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF31B6B2),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
