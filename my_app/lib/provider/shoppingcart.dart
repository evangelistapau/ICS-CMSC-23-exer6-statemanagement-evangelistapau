import 'package:flutter/material.dart';
import '../model/item.dart';

class ShoppingCart extends ChangeNotifier {  
  List<Item> _products = [];  // List to store items in the cart

  List<Item> get cart => _products; // Getter method to access the cart items

  void addItem(Item item) {  //add an item to the cart
    _products.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _products.remove(item);  //removing an item from the cart
    notifyListeners();
  }

  double getTotal() {  //calculates the total cost of items in the cart
    double total = 0; 
    for (int i = 0; i < _products.length;i++) {
      total = total + _products[i].price;
    }
    return total;
  }

  void removeAll() {  //removing all items from the cart
    _products.clear();
    notifyListeners();
  }
}