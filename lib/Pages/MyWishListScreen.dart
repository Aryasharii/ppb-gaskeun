import 'package:flutter/material.dart';

class MyWishListScreen extends StatelessWidget {
  final List<WishListItem> wishListItems = [
    WishListItem(
      name: 'Rendang',
      description: 'Taste Our Hot Rendang, We Provide Our Great Foods',
      price: 'Rp. 50,000.00',
      imagePath: 'assets/icons/rendang.jpeg',
    ),
    WishListItem(
      name: 'Hot Pizza',
      description: 'Taste Our Hot Pizza, We Provide Our Great Foods',
      price: 'Rp. 100,000.00',
      imagePath: 'assets/icons/pizza.png',
    ),
    WishListItem(
      name: 'Sate',
      description: 'Taste Our Sate, We Provide Our Great Foods',
      price: 'Rp. 20,000.00',
      imagePath: 'assets/icons/sate.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wish List'),
        backgroundColor: Color(0xFF66B2B2),
      ),
      body: ListView.builder(
        itemCount: wishListItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(wishListItems[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wishListItems[index].name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          wishListItems[index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          wishListItems[index].price,
                          style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WishListItem {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  WishListItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
