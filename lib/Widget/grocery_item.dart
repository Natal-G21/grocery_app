import 'package:flutter/material.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Provider/cart_provider.dart';
import 'package:grocery_app/Provider/favorite_provider.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:provider/provider.dart';

class GroceryItem extends StatelessWidget {
  final Groceryitems groceryitems;

  const GroceryItem({super.key, required this.groceryitems});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = provider.favoriteItems;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      width: 192,
      height: 260,
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
            height: 120,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              Text(
                groceryitems.price ?? "0",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      provider.toggleFavorite(groceryitems);
                    },
                    child: Icon(
                      provider.isExist(groceryitems)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          provider.isExist(groceryitems)
                              ? Colors.red
                              : Colors.black,
                      size: 27,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      cartProvider.addToCart({
                        'id': groceryitems.id,
                        'name': groceryitems.name,
                        'price': groceryitems.price,
                        'image': groceryitems.image,
                      });
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
