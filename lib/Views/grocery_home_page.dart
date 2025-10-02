import 'package:flutter/material.dart';
import 'package:grocery_app/Model/catagory_model.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:grocery_app/Widget/my_search_bar.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconderyColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      children: [
                        TextSpan(
                          text: "Hello,",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Smith\n",
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: "What do you need",
                          style: TextStyle(fontSize: 17, color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined, size: 27),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Quality you can test,\nfreshness you can trust",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MySearchBar(onsearch: (onsearch) {}),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Catagory",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      Icon(Icons.keyboard_arrow_left, color: Colors.black38),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        groceryModel.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              // TODO 1: 
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      groceryModel[index].image!,
                                    ),
                                    width: 100,
                                  ),
                                  Text(groceryModel[index].name!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
