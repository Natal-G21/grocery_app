class Groceryitems {
  final String? image;
  final String? name;
  final String? price;

  Groceryitems({this.image, this.name,this.price});
}

List<Groceryitems> groceryitem = [
  Groceryitems(image: "assets/image/fruit.jpg", name: "Fruits", price: "2.1"),
  Groceryitems(image: "assets/image/Vegetables.jpg", name: "Vegetables", price: "3"),
  Groceryitems(image: "assets/image/bakery.jpg", name: "Bakery", price: "5"),
  Groceryitems(image: "assets/image/spices.jpg", name: "Spices", price: "4"),
  Groceryitems(image: "assets/image/fruit.jpg", name: "Fruits", price: "7"),
  Groceryitems(image: "assets/image/fruit.jpg", name: "Vegetables", price: "8")
];
