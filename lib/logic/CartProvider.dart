import 'package:flutter/foundation.dart';
import 'package:mytaste/model/FoodList.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => (_items);

  /// The current total price of all items (assuming all items cost $42).
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeItem(String name) {
    _items.removeWhere(
      (element) => element.name == name,
    );
    notifyListeners();
  }
}
