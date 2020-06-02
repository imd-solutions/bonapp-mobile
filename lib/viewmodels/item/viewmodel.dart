import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class ItemViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();

  void initialise() {}

  int get cartItemCount => _cartService.itemCount;
  int getItemCount() {
    return 0;
  }

  int itemAmount(id) {
    return _cartService.itemAmount(id);
  }

  void addItemToCart(int pid, String name, double price) {
    _cartService.addItem(pid, name, price);
    notifyListeners();
  }

  void removeSingleItemFromCart(int pid) {
    _cartService.removeSingleItem(pid);
    notifyListeners();
  }
}
