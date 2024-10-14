import 'package:flutter/foundation.dart';
import 'package:frontend/models/product.dart';

class Cart extends ChangeNotifier {
  final Map<Product, int> _cartItems = {};
  int _itemCount = 0;

  Map<Product, int> get cartItems => _cartItems;
  int get itemCount => _itemCount;

  void addItemCount(int count) {
    _itemCount += count;
    notifyListeners();
  }

  void addToCart(Product product, {int quantity = 1}) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + quantity;
    } else {
      _cartItems[product] = quantity;
    }
    addItemCount(quantity);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _itemCount -= _cartItems[product]!;
      _cartItems.remove(product);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    _itemCount = 0;
    notifyListeners();
  }

  double totalPrice() {
  double totalPrice = 0;
  for (var entry in _cartItems.entries) {
    totalPrice += entry.key.price * entry.value;
  }
  return totalPrice;
}
}

