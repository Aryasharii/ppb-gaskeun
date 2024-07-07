import 'package:flutter/material.dart';
import 'package:purify/models/order.dart'; 
import 'package:purify/Pages/HomePage.dart';
import 'package:purify/Pages/CartPage.dart';
import 'package:purify/Pages/MyAccountScreen.dart';
import 'package:purify/Pages/MyWishListScreen.dart';
import 'package:purify/Pages/SettingsScreen.dart';
import 'package:purify/Pages/PaymentScreen.dart';
import 'package:purify/Pages/MyOrdersScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderId: 1,
      items: [],
      totalAmount: 0,
      deliveryCost: 0,
    ),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RE:PLATE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff5f5f3),
      ),
      initialRoute: "/", // Set initial route to HomePage
      routes: {
        "/": (context) => HomePage(),
        "/cartPage": (context) => CartPage(),
        "/myAccount": (context) => MyAccountScreen(),
        "/myOrders": (context) => MyOrdersScreen(orders: orders), // Pass orders to MyOrdersScreen
        "/myWishList": (context) => MyWishListScreen(),
        "/settings": (context) => SettingsScreen(),
        "/payment": (context) => PaymentScreen(), // Use PaymentScreen for payment route
      },
    );
  }
}
