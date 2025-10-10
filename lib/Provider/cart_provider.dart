import 'package:flutter/widgets.dart';
import 'package:grocery_app/Provider/Model/cart_model.dart';
import 'package:grocery_app/Widget/grocery_item.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  //Add a product to cart

  void addToCart(Map<String, dynamic> grocery) {
    if (productExist(grocery)) {
      int index = _carts.indexWhere(
        (element) => element.grocery['id'] == grocery['id'],
      );
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      _carts.add(CartModel(grocery: grocery, quantity: 1));
    }
    notifyListeners();
  }

  bool productExist(Map<String, dynamic> grocery) {
    return _carts.any((element) => element.grocery['id'] == grocery['id']);
  }

  void addQuantity(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['id'] == grocery['id'],
    );
    if (index != -1) {
      _carts[index].quantity = _carts[index].quantity + 1;
      notifyListeners();
    }
  }
  //reduce quantity

  void reduceQuantity(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['id'] == grocery['id'],
    );
    if (index != -1) {
      _carts[index].quantity = _carts[index].quantity - 1;
      notifyListeners();
    } else {
      _carts.removeAt(index);
    }

    //cheek if product already exist in the cart

    bool productExist(Map<String, dynamic> grocery) {
      return _carts.indexWhere(
            (element) => element.grocery['id'] == grocery['id'],
          ) !=
          -1;
    }
  }

  //calculate total price of all item in the cart
  void removeFromCart(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['id'] == grocery['id'],
    );
    if (index != -1) {
      _carts.removeAt(index);
      notifyListeners();
    }
  }

  double totalCart() {
    double total = 0;
    for (var i = 0; i < carts.length; i++) {
      total +=
          _carts[i].quantity *
          double.parse(_carts[i].grocery["price"].toString());
    }
    return total;
  }
}
