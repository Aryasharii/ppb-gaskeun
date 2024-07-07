import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {'title': 'New promotion available!', 'subtitle': 'Check out our latest deals', 'time': '2 hours ago'},
    {'title': 'Your order has been shipped', 'subtitle': 'Track your order in the app', 'time': '1 day ago'},
    {'title': 'Welcome to our app', 'subtitle': 'Get started by exploring features', 'time': '2 days ago'},
    // Tambahkan lebih banyak notifikasi di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFF66B2B2),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF66B2B2),
                child: Icon(Icons.notifications, color: Colors.white),
              ),
              title: Text(
                notifications[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notifications[index]['subtitle']!),
                  SizedBox(height: 5),
                  Text(
                    notifications[index]['time']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              onTap: () {
                // Implementasi ketika notifikasi diklik
              },
            ),
          );
        },
      ),
    );
  }
}
