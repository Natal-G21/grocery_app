import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Model/cart_model.dart';
import 'package:grocery_app/Provider/cart_provider.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:grocery_app/Widget/cart_items.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts.reversed.toList();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: seconderyColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: seconderyColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    carts.length,
                    (index) => SizedBox(height: 100, width: size.width,child: CartItems(cart: carts[index]),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
