class Groceryitems {
  final String id;
  final String? image;
  final String? name;
  final String? price;
  final String? rating;
  final String? description;

  Groceryitems({
    required this.id,
    this.image,
    this.name,
    this.price,
    this.rating,
    this.description,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Groceryitems && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

// Sample grocery item data
List<Groceryitems> groceryitem = [
  Groceryitems(
    id: '1',
    image: "assets/image/fruit.jpg",
    name: "Fruits",
    price: "2.1/kg",
    rating: "3.3",
    description:
        "Fruits bring natural sweetness and freshness to every meal. They are rich in vitamins, minerals, and fiber that keep your body strong. From juicy mangoes to crisp apples, fruits come in many colors and flavors. They help boost your immune system and improve digestion. Perfect for snacks, juices, and desserts any time of the day. Our fruits are carefully selected for freshness and quality.",
  ),
  Groceryitems(
    id: '2',
    image: "assets/image/Vegetables.jpg",
    name: "Vegetables",
    price: "3/kg",
    rating: "4.7",
    description:
        "Vegetables are the heart of a healthy diet. They are full of vitamins, minerals, and natural fiber. From leafy greens to root veggies, they add flavor and color to your meals. They support your immune system and help maintain good health. Freshly picked vegetables keep their nutrients and taste. Perfect for salads, soups, and everyday cooking. We offer both organic and locally grown varieties.",
  ),
  Groceryitems(
    id: '3',
    image: "assets/image/bakery.jpg",
    name: "Bakery",
    price: "5/kg",
    rating: "4.8",
    description:
        "Our bakery section is filled with freshly baked delights. Enjoy the warm smell of bread, cakes, and pastries every day. Each item is made with love and high-quality ingredients. From soft loaves to crispy rolls, there’s something for everyone. Perfect for breakfast, lunch, or a sweet snack anytime. We bake daily to ensure freshness and great taste.",
  ),
  Groceryitems(
    id: '4',
    image: "assets/image/spices.jpg",
    name: "Spices",
    price: "4/kg",
    rating: "3.9",
    description:
        "Spices bring life, color, and aroma to your dishes. They turn simple meals into rich and flavorful experiences. From mild to hot, we have spices for every taste. Freshly packed to keep their strong and natural scent. Perfect for cooking traditional or modern recipes. Add a pinch to boost flavor and awaken your senses.",
  ),
  Groceryitems(
    id: '5',
    image: "assets/image/dairy.jpg",
    name: "Dairy",
    price: "7/kg",
    rating: "3.5",
    description:
        "Our dairy and beverage section keeps you refreshed and energized. Find milk, cheese, butter, and fresh drinks for every moment. Perfect for breakfast, smoothies, or light snacks. All products are fresh, clean, and stored at the right temperature. We offer both full-cream and low-fat options. Stay hydrated with natural juices and cold beverages.",
  ),
  Groceryitems(
    id: '6',
    image: "assets/image/fruit.jpg",
    name: "Mixed Vegetables",
    price: "8/kg",
    rating: "4.3",
    description:
        "Mixed vegetables bring natural sweetness and freshness to every meal. They are rich in vitamins, minerals, and fiber that keep your body strong. From carrots to beans, they add color and nutrition to your plate. Perfect for salads, stir-fries, and soups. Our vegetables are carefully selected for freshness and quality.",
  ),
];
