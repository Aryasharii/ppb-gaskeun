import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int pizzaCount = 0;
  int burgerCount = 0;
  int drinkCount = 0;

  int pizzaPrice = 100000;
  int burgerPrice = 20000;
  int drinkPrice = 10000;

  // Menghitung total item yang dipilih
  int get totalCount => pizzaCount + burgerCount + drinkCount;

  // Menghitung total pembayaran
  int get totalPay =>
      (pizzaCount * pizzaPrice) + (burgerCount * burgerPrice) + (drinkCount * drinkPrice);

  // Method untuk menghitung biaya pengiriman
  int calculateDeliveryCost() {
    int deliveryCost = 10000; // Biaya pengiriman awal
    int totalItems = totalCount;
    if (totalItems < 1) {
      deliveryCost = 0;
    }
   if (totalItems > 0) {
      deliveryCost = 10000;
    }
    if (totalItems > 2) {
      deliveryCost += ((totalItems - 2) ~/ 2) * 1000;
    }
    return deliveryCost;
  }

  // Method untuk menambah jumlah pizza
  void incrementPizza() {
    setState(() {
      pizzaCount++;
    });
  }

  // Method untuk mengurangi jumlah pizza
  void decrementPizza() {
    if (pizzaCount > 0) {
      setState(() {
        pizzaCount--;
      });
    }
  }

  // Method untuk menambah jumlah burger
  void incrementBurger() {
    setState(() {
      burgerCount++;
    });
  }

  // Method untuk mengurangi jumlah burger
  void decrementBurger() {
    if (burgerCount > 0) {
      setState(() {
        burgerCount--;
      });
    }
  }

  // Method untuk menambah jumlah minuman
  void incrementDrink() {
    setState(() {
      drinkCount++;
    });
  }

  // Method untuk mengurangi jumlah minuman
  void decrementDrink() {
    if (drinkCount > 0) {
      setState(() {
        drinkCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Order List",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Membangun item kartu untuk pizza, burger, dan minuman
                  buildCartItem("Hot Pizza", "Taste Our Hot Pizza", "assets/icons/pizza.png",
                      pizzaCount, pizzaPrice, incrementPizza, decrementPizza),
                  buildCartItem("Hot Burger", "Taste Our Hot Burger", "assets/icons/burger.png",
                      burgerCount, burgerPrice, incrementBurger, decrementBurger),
                  buildCartItem("Cold Drink", "Taste Our Cold Drink", "assets/icons/drink.png",
                      drinkCount, drinkPrice, incrementDrink, decrementDrink),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Menampilkan ringkasan item, subtotal, biaya pengiriman, dan total
                          buildSummaryRow("Items:", totalCount.toString(), isCurrency: false),
                          Divider(color: Colors.black),
                          buildSummaryRow("Sub-Total:", totalPay.toString()),
                          Divider(color: Colors.black),
                          buildSummaryRow("Delivery:", calculateDeliveryCost().toString()),
                          Divider(color: Colors.black),
                          buildSummaryRow(
                              "Total:", (totalPay + calculateDeliveryCost()).toString(), isTotal: true),
                          Divider(color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(
        totalAmount: totalPay,
        itemsList: [
          {"name": "Hot Pizza", "quantity": pizzaCount, "price": pizzaPrice},
          {"name": "Hot Burger", "quantity": burgerCount, "price": burgerPrice},
          {"name": "Cold Drink", "quantity": drinkCount, "price": drinkPrice},
        ],
        deliveryCost: calculateDeliveryCost(),
      ),
    );
  }

  // Membangun item kartu dengan judul, subtitle, gambar, jumlah, harga, dan fungsi penambahan dan pengurangan
  Widget buildCartItem(String title, String subtitle, String imagePath, int count, int price,
      VoidCallback increment, VoidCallback decrement) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Container(
        width: 380,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 80,
                width: 150,
              ),
            ),
            Container(
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Rp. ${price.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFF31B6B2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: increment,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: decrement,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Membangun baris ringkasan dengan label, nilai, opsi untuk mata uang, dan opsi untuk menonaktifkan border bawah
  Widget buildSummaryRow(String label, String value, {bool isCurrency = true, bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isCurrency ? 'Rp. $value' : value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

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
              Navigator.pushNamed(
                context,
                '/payment',
                arguments: {
                  'totalAmount': totalAmount,
                  'items': itemsList,
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