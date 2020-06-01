import 'package:flutter_bonapp/models/cart.dart';

class CartService {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(int pid, String name, double price) {
    if (_items.containsKey(pid.toString())) {
      _items.update(
        pid.toString(),
        (existingCartItem) => CartItem(
            id: pid,
            name: existingCartItem.name,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price),
      );
    } else {
      _items.putIfAbsent(
        pid.toString(),
        () => CartItem(
          name: name,
          id: pid,
          quantity: 1,
          price: price,
        ),
      );
    }
  }

  void removeItem(int id) {
    _items.remove(id);

  }

  void removeSingleItem(int id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id.toString(),
              (existingCartItem) => CartItem(
              id: id,
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
  }

  void clear() {
    _items = {};
  }
}
