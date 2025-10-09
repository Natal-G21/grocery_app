import 'package:flutter/material.dart';
import 'package:grocery_app/Model/catagory_model.dart';
import 'package:grocery_app/Model/grocery_items.dart';
import 'package:grocery_app/Utility/constants.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/Provider/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = provider.favoriteItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: seconderyColor,
        centerTitle: true,
        title: Text("Favorite", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:
          favoriteItems.isEmpty
              ? const Center(
                child: Text(
                  "No Favorite Yet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
              : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final favorite = favoriteItems[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      groceryModel[index].image!,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${favorite.name}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "\$${favorite.price!}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 35,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              provider.toggleFavorite(favorite);
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
    );
  }
}
