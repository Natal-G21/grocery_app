import 'package:flutter/material.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:grocery_app/Views/cart_screen.dart';
import 'package:grocery_app/Views/favorite_screen.dart';
import 'package:grocery_app/Views/grocery_home_page.dart';
import 'package:iconsax/iconsax.dart';

class GroceryAppMainScreen extends StatefulWidget {
  GroceryAppMainScreen({super.key});

  @override
  State<GroceryAppMainScreen> createState() => _GroceryAppMainScreenState();
}

class _GroceryAppMainScreenState extends State<GroceryAppMainScreen> {
  int selectedIndex = 0;
  final List pages = [
    GroceryHomePage(),
    FavoriteScreen(),
    CartScreen(),
    const Scaffold(body: Center(child: Text('Cart'))),
    const Scaffold(body: Center(child: Text('Profile'))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconderyColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black45,
        elevation: 0,
        backgroundColor: seconderyColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            activeIcon: Icon(Iconsax.home5),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            activeIcon: Icon(Iconsax.heart5),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            activeIcon: Icon(Iconsax.shopping_cart5),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            activeIcon: Icon(Iconsax.user5),
            label: "Profile",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
