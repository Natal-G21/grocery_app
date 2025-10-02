import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final Function(String) onsearch;
  const MySearchBar({super.key,required this.onsearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          spreadRadius: 3,
          offset: Offset(0, 5),
        )
      ]
      ),
      child: TextField(
        onChanged: onsearch,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: "Search for items here",
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
