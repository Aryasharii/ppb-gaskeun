import 'package:flutter/material.dart';
import 'package:purify/Pages/CommentPage.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            CategoryItem(imagePath: 'assets/icons/pizza.png', productId: 'pizza'),
            CategoryItem(imagePath: 'assets/icons/drink.png', productId: 'drink'),
            CategoryItem(imagePath: 'assets/icons/salan.png', productId: 'salan'),
            CategoryItem(imagePath: 'assets/icons/biryani.png', productId: 'biryani'),
            CategoryItem(imagePath: 'assets/icons/burger.png', productId: 'burger'),
            CategoryItem(imagePath: 'assets/icons/pisang keju.png', productId: 'pisangkeju'),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String productId;

  const CategoryItem({Key? key, required this.imagePath, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommentPage(
                imagePath: imagePath,
                productId: productId,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
