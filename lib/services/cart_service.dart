import 'package:flutter_bonapp/models/cart.dart';

class CartService {
  Map<String, CartItem> _items = {};
  double _cartSubTotal = 0.00;

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get cartSubTotal => _cartSubTotal;
  double get cartTax => _cartSubTotal * 0.2;
  double get cartTotal => _cartSubTotal + (_cartSubTotal * 0.2);

  void amount() {
    _cartSubTotal = 0.00;
    _items.forEach((key, value) {
      _cartSubTotal += (value.price * value.quantity);
    });
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(int pid, String name, String subtitle, double price) {
    _cartSubTotal = 0.00;
    if (_items.containsKey(pid.toString())) {
      _items.update(
        pid.toString(),
        (existingCartItem) => CartItem(
          id: pid,
          name: existingCartItem.name,
          subtitle: existingCartItem.subtitle,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        pid.toString(),
        () => CartItem(
          name: name,
          subtitle: subtitle,
          id: pid,
          quantity: 1,
          price: price,
        ),
      );
    }
  }

  void removeItem(int id) {
    _items.remove(id.toString());
    _cartSubTotal = 0.00;
    _items.forEach((key, value) {
      _cartSubTotal += (value.price * value.quantity);
    });
  }

  void removeSingleItem(int id) {
    _cartSubTotal = 0.00;
    if (!_items.containsKey(id.toString())) {
      return;
    }
    if (_items[id.toString()].quantity > 1) {
      _items.update(id.toString(), (existingCartItem) => CartItem(id: id, name: existingCartItem.name, quantity: existingCartItem.quantity - 1, price: existingCartItem.price));
    } else {
      _items.update(id.toString(), (existingCartItem) => CartItem(id: id, name: existingCartItem.name, quantity: existingCartItem.quantity = 0, price: existingCartItem.price));
      removeItem(id);
    }
  }

  int itemAmount(int id) {
    if (_items.containsKey(id.toString())) {
      return _items[id.toString()].quantity;
    } else {
      return int.parse('0');
    }
  }

  void clear() {
    _items = {};
    _cartSubTotal = 0.0;
  }
}
