import 'package:flutter/material.dart';
import 'package:purify/models/order.dart'; // Adjust the path as necessary

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
                    _showOrderDetails(widget.orders[index]);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      _cancelOrder(index);
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showOrderDetails(Order order) {
    // Implement order details dialog or navigation here
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Order Details'),
        content: Text('Implement order details view here'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _cancelOrder(int index) {
    // Implement cancel order functionality here
    setState(() {
      widget.orders[index].status = 'Canceled';
    });
  }
}
