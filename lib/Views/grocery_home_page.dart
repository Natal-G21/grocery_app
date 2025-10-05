import 'package:flutter/material.dart';
import 'package:grocery_app/Model/catagory_model.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:grocery_app/Views/see_all_product.dart';
import 'package:grocery_app/Widget/grocery_item.dart';
import 'package:grocery_app/Widget/my_search_bar.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  String catagory = '';

  void filterProductByCatagory(String categoryName) {
    setState(() {
      catagory = categoryName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconderyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ✅ Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                          children: [
                            const TextSpan(
                              text: "Hello,",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Natty\n",
                              style: TextStyle(color: primaryColor),
                            ),
                            const TextSpan(
                              text: "What do you need",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                         
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),

                /// ✅ Subtitle
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

                const SizedBox(height: 15),

                /// ✅ Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchBar(onsearch: (value) {}),
                ),

                const SizedBox(height: 20),

                /// ✅ Category Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children:  [
                      Text(
                        "Catagory",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      Icon(Icons.keyboard_arrow_left, color: Colors.black),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                /// ✅ Category List
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      groceryModel.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            filterProductByCatagory(groceryModel[index].name!);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width:
                                    catagory == groceryModel[index].name
                                        ? 2
                                        : 1,
                              ),
                              color:
                                  catagory == groceryModel[index].name
                                      ? primaryColor
                                      : seconderyColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        groceryModel[index].image!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  groceryModel[index].name!,
                                  style: TextStyle(
                                    fontWeight:
                                        catagory == groceryModel[index].name
                                            ? FontWeight.bold
                                            : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children:  [
                      Text(
                        "Tind By Catagory",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAllProduct(),
                            ),
                          );
                        },
                      ),
                      Icon(Icons.keyboard_arrow_left, color: Colors.black),
                    ],
                  ),
                ),

                //catagory items list
                groceryitem.isEmpty
                    ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          "No product available in this catagory",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(groceryitem.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 15,
                              bottom: 15,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: GroceryItem(
                                groceryitems: groceryitem[index],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
