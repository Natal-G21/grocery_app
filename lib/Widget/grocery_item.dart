import 'package:flutter/material.dart';
import 'package:grocery_app/Model/grocery_items.dart';

class GroceryItem extends StatelessWidget {
  final Groceryitems groceryitems;

  const GroceryItem({super.key, required this.groceryitems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xffF7FFF7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 173,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(groceryitems.image!),
              ),
            ),
          ),

          SizedBox(height: 10),
          Text(
            groceryitems.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
