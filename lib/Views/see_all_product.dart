import 'package:flutter/material.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:grocery_app/Views/grocery_home_page.dart';
import 'package:grocery_app/Widget/grocery_item.dart';
import 'package:grocery_app/Widget/my_search_bar.dart';

class SeeAllProduct extends StatefulWidget {
  const SeeAllProduct({super.key});

  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconderyColor,
      appBar: AppBar(
        backgroundColor: seconderyColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Grocery Product",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(onsearch: (value) {}),
              const SizedBox(height: 25),
              Expanded(
                child: GridView.builder(
                   itemCount: groceryitem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.662,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GroceryItem(groceryitems: groceryitem[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
