import 'package:flutter/material.dart';
import 'package:purify/models/order.dart'; // Sesuaikan path sesuai kebutuhan
import 'package:purify/Pages/OrderDetailScreen.dart'; // Sesuaikan path sesuai kebutuhan

class MyOrdersScreen extends StatefulWidget {
  final List<Order> orders;

  MyOrdersScreen({required this.orders});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: widget.orders.isEmpty
          ? Center(
              child: Text('No orders yet.'),
            )
          : ListView.builder(
              itemCount: widget.orders.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Order ${widget.orders[index].orderId}'),
                  subtitle: Text('Status: ${widget.orders[index].status}'),
                  onTap: () {
                    _showOrderDetails(context, widget.orders[index]);
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _cancelOrder(index);
                        },
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          _completeOrder(index);
                        },
                        child: Text('Complete'),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void _showOrderDetails(BuildContext context, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailScreen(
          items: order.items,
          totalAmount: order.totalAmount,
          deliveryCost: order.deliveryCost,
          paymentMethod: order.paymentMethod, // Meneruskan paymentMethod
        ),
      ),
    );
  }

  void _cancelOrder(int index) {
    setState(() {
      widget.orders[index].status = 'Canceled';
    });
  }

  void _completeOrder(int index) {
    setState(() {
      widget.orders[index].status = 'Completed';
    });
  }
}
