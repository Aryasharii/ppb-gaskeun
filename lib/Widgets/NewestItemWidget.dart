import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewestItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildSingleItem(
              imagePath: "assets/icons/rendang.jpeg",
              name: "Rendang",
              description: "Taste Our Hot Rendang, We Provide Our Great Foods",
              price: "Rp. 50,000.00",
            ),
            _buildSingleItem(
              imagePath: "assets/icons/pizza.png",
              name: "Hot Pizza",
              description: "Taste Our Hot Pizza, We Provide Our Great Foods",
              price: "Rp. 100,000.00",
            ),
            _buildSingleItem(
              imagePath: "assets/icons/sate.jpeg",
              name: "Sate",
              description: "Taste Our Sate, We Provide Our Great Foods",
              price: "Rp. 20,000.00",
            ),
            _buildSingleItem(
              imagePath: "assets/icons/spagheti .png",
              name: "Spagheti",
              description: "Taste Our Spagheti, We Provide Our Great Foods",
              price: "Rp. 50,000.00",
            ),
            _buildSingleItem(
              imagePath: "assets/icons/es campur.png",
              name: "Es Campur",
              description: "Taste Our Es Campur, We Provide Our Great Foods",
              price: "Rp. 10,000.00",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleItem({
    required String imagePath,
    required String name,
    required String description,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.red,
                          size: 18,
                        );
                      }),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 26,
                        ),
                        Icon(
                          CupertinoIcons.cart,
                          color: Colors.red,
                          size: 26,
                        ),
                      ],
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
}
