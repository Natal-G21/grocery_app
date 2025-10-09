import 'package:flutter/material.dart';
import 'package:grocery_app/Model/catagory_model.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Utility/constants.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Groceryitems item;
  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconderyColor,
      appBar: AppBar(
        backgroundColor: seconderyColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Product Details", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item.image!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              item.name!,
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber[700]),
                SizedBox(width: 5),
                Text(
                  item.rating!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  item.price!,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.description != null
                      ? Text(
                        item.description!,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )
                      : Text(
                        "No description available.",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: primaryColor,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: primaryColor,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
